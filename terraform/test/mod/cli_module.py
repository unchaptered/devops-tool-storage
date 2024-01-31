import argparse

from abc import ABC


class AbstractCLIModule(ABC):
    pass


class CLIModule(AbstractCLIModule):

    def __init__(self):
        self.parser = argparse.ArgumentParser(
            description="terraform test runner"
        )

        requireArguments = self.parser.add_mutually_exclusive_group()
        requireArguments.add_argument('-I',
                                      '--init',
                                      action='store_true',
                                      help='초기화')
        requireArguments.add_argument('-V',
                                      '--validate',
                                      action='store_true',
                                      help='유효성 검사')
        requireArguments.add_argument('-P',
                                      '--plan',
                                      action='store_true',
                                      help='계획 수립')

    def execute(self):
        args = self.parser.parse_args()

        commands = ["terraform"]
        if args.init:
            commands.append('init')
        if args.validate:
            commands.append('validate')
        if args.plan:
            commands.append('plan')

        return ' '.join(commands)


if __name__ == '__main__':
    cliModule = CLIModule()
    cliModule.execute()
