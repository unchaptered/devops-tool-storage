import asyncio
import subprocess
from typing import Tuple, Optional
from abc import ABC, abstractmethod


class AbstractProcessModule(ABC):

    @abstractmethod
    def execPowershellSync(
        self,
        *,
        orgCommand: str,
        cwd: Optional[str] = None
    ):
        raise NotImplementedError(
            'AbstractProcessModule.execSync must be override')

    @abstractmethod
    async def execPowershellAsync(
        self,
        *,
        orgCommand,
        cwd: Optional[str] = None
    ):
        raise NotImplementedError(
            'AbstractProcessModule.execSync must be override')

    @abstractmethod
    def execSync(
        self,
        *,
        orgCommand: str,
        cwd: Optional[str] = None
    ):
        raise NotImplementedError(
            'AbstractProcessModule.execSync must be override')

    @abstractmethod
    async def execAsync(
        self,
        *,
        orgCommand: str,
        cwd: Optional[str] = None
    ):
        raise NotImplementedError(
            'AbstractProcessModule.execAsync must be override')


class ProcessModule(AbstractProcessModule):

    def execPowershellSync(
        self,
        *,
        orgCommand: str,
        cwd: Optional[str] = None
    ) -> Tuple[str, str]:

        inputCommand = ["powershell", "-Command", orgCommand]
        result = subprocess.run(inputCommand,
                                cwd=cwd,
                                stdin=subprocess.PIPE,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE,
                                encoding='utf-8',
                                text=True,
                                check=True)

        return result.stdout, result.stderr

    async def execPowershellAsync(
        self,
        *,
        orgCommand,
        cwd: Optional[str] = None
    ):
        inputCommand = ["powershell", "-Command", orgCommand]

        process = await asyncio.create_subprocess_exec(*inputCommand,
                                                       cwd=cwd,
                                                       stdin=subprocess.PIPE,
                                                       stdout=subprocess.PIPE,
                                                       stderr=subprocess.PIPE)
        stdout, stderr = await process.communicate()

        return str(stdout), str(stderr)

    def execSync(
        self,
        *,
        orgCommand: str,
        cwd: Optional[str] = None
    ) -> Tuple[str, str]:
        return self.execPowershellSync(orgCommand=orgCommand,
                                       cwd=cwd)

    async def execAsync(
        self,
        *,
        orgCommand: str,
        cwd: Optional[str] = None
    ):
        return await self.execPowershellAsync(orgCommand=orgCommand,
                                              cwd=cwd)
