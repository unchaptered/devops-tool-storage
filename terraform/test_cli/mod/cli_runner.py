import asyncio

from mod.process_module import ProcessModule
from mod.config_modules import ConfigModule
from mod.test_module import TestModule


async def runCommandAsync(*, command: str):
    """_method_
    """

    configModule = ConfigModule()
    processModule = ProcessModule()
    testModule = TestModule()

    processCommand = f"Get-ChildItem -Path { configModule.baseDir } -Recurse | Where-Object {'{ $_.PSIsContainer -eq $false }'} | Select-Object -ExpandProperty FullName"

    processResult = await processModule.execAsync(orgCommand=processCommand)
    testDirList = await testModule.filtertestDirList(processResult=processResult)

    await testModule.parallelTest(testDirList=testDirList, command=command)

if __name__ == '__main__':
    asyncio.run(runCommandAsync(command='terraform init'))
