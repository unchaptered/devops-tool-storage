import asyncio
from mod.cli_runner import runCommandAsync
from mod.cli_module import CLIModule

if __name__ == '__main__':
    cliModule = CLIModule()

    COMMAND = cliModule.execute()
    asyncio.run(runCommandAsync(command=COMMAND))
