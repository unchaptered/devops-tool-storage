import os
from typing import List


class FolderModule():

    BASE_EXCEPT_FOLDERS = ['__pycache__']
    BASE_EXCEPT_FILES = []

    async def getBaseFolder(self):
        return './'

    async def getFolderAndFileList(
        self,
        *,
        baseFolder: str = './',
    ) -> List[str]:
        print(baseFolder)

        return os.listdir(baseFolder)

    async def getFolderList(
        self,
        *,
        baseDir: str = '',
        targetDir: str = './',
        exceptFolders: List[str] = BASE_EXCEPT_FOLDERS
    ) -> List[str]:

        joinedDir = os.path.join(baseDir, targetDir)

        return [
            target
            for target in (await self.getFolderAndFileList(baseFolder=joinedDir))
            if (
                os.path.isdir(joinedDir)
                and target not in exceptFolders
            )
        ]

    async def getFileList(
        self,
        *,
        baseDir: str = '',
        targetDir: str = './',
        exceptFiles: List[str] = BASE_EXCEPT_FILES
    ) -> List[str]:

        joinedDir = os.path.join(baseDir, targetDir)

        return [
            target
            for target in (await self.getFolderAndFileList(baseFolder=joinedDir))
            if (
                not os.path.isdir(joinedDir)
                and target not in exceptFiles
            )
        ]
