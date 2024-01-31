import re
import asyncio
from typing import Tuple, List

from mod.process_module import ProcessModule


class TestModule:

    TF_REGEX = r'\.tf$'

    def __init__(self):
        self.processModule = ProcessModule()

    async def filtertestDirList(
        self,
        *,
        processResult: Tuple[str, str]
    ) -> List[str]:

        testDirList = []

        for file in processResult[0].split('\\r\\n'):
            splitedPath = file.rsplit('\\', 2)

            if len(splitedPath) < 2:
                continue

            folder = splitedPath[0].replace('\\\\', '\\')
            file = splitedPath[2]

            hasTf = re.search(self.TF_REGEX, file) is not None
            if hasTf and folder not in testDirList:
                testDirList.append(folder)

        return testDirList

    async def test(self,
                   *,
                   testDir: str,
                   command: str):

        print('❎ : ', testDir)
        processResult = await self.processModule.execAsync(cwd=testDir,
                                                           orgCommand=command)
        stdout, stderr = processResult
        print('⭕ : ', testDir, len(stdout), len(stderr))

        return 'A'

    async def parallelTest(
        self,
        *,
        testDirList: List[str],
        command: str
    ):

        targetTests = []
        maxPartSize = 5

        totalTaskResult = []
        for testDir in testDirList:
            targetTests.append(testDir)

            if len(targetTests) >= maxPartSize:
                tasks = [self.test(testDir=t, command=command)
                         for t in targetTests]
                taskResults = await asyncio.gather(*tasks)

                totalTaskResult.extend(taskResults)
                targetTests = []

        tasks = [self.test(testDir=t, command=command) for t in targetTests]
        taskResults = await asyncio.gather(*tasks)

        totalTaskResult.extend(taskResults)
        targetTests = []

        for taskResult in taskResults:
            print(taskResult)
