import json
import os

from abc import ABC, abstractmethod


class AbstractConfigModule(ABC):

    @abstractmethod
    def loadConfigParam(
        self,
        *,
        key: str,
        data: dict,
        isDir: bool = False,
    ):
        msg = "AbstractConfigModule.loadConfigParam must be override"
        raise NotImplementedError(msg)

    @abstractmethod
    def loadConfig(self):

        msg = "AbstractConfigModule.loadConfig must be override"
        raise NotImplementedError(msg)


class ConfigModule(AbstractConfigModule):

    rootDir: str
    baseDir: str
    outDir: str

    def __init__(self):
        self.loadConfig()

    def loadConfigParam(
        self,
        *,
        key: str,
        data: dict,
        isDir: bool = False,
    ):
        """
        Set attributes in self.
        If isDir == true, key is joined by self.rootDir

        Args:
            key (str): _description_
            data (dict): _description_
            isDir (bool, optional): _description_. Defaults to False.
        """
        if key in data:
            if isDir:
                setattr(self, key, os.path.join(self.rootDir,
                        data[key].replace('./', '').replace('^.', '')))

            else:
                setattr(self, key, data[key])

    def loadConfig(self):
        self.rootDir = os.getcwd()
        configFile = os.path.join(self.rootDir, 'test/test.config.json')

        with open(file=configFile,
                  encoding="utf-8") as file:
            data = json.load(file)

            self.loadConfigParam(data=data, key='outDir', isDir=True)
            self.loadConfigParam(data=data, key='baseDir', isDir=True)
