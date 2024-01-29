import argparse


def init_action():
    # 초기화 동작 수행
    print("초기화 동작 수행")


def validate_action():
    # 유효성 검사 동작 수행
    print("유효성 검사 동작 수행")


def plan_action():
    # 계획 수립 동작 수행
    print("계획 수립 동작 수행")


def apply_action():
    # 적용 동작 수행
    print("적용 동작 수행")


def main():
    parser = argparse.ArgumentParser(description='간단한 CLI 예제')
    parser.add_argument('-I', '--init', action='store_true', help='초기화')
    parser.add_argument('-V', '--validate', action='store_true', help='유효성 검사')
    parser.add_argument('-P', '--plan', action='store_true', help='계획 수립')
    parser.add_argument('-a', '--apply', action='store_true', help='적용')

    args = parser.parse_args()

    if args.init:
        init_action()
    elif args.validate:
        validate_action()
    elif args.plan:
        plan_action()
    elif args.apply:
        apply_action()
    else:
        print("올바른 옵션을 지정하세요.")


if __name__ == '__main__':
    main()
