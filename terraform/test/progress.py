import time
from tqdm import tqdm

# 진행바를 보여줄 함수


def show_progress_bar(iterable, desc="", total=None):
    for item in tqdm(iterable, desc=desc, total=total, unit="개"):
        # 작업 수행 시간 대신 sleep을 사용하여 예시로 대체
        time.sleep(0.1)


# 예시: 1부터 10까지의 숫자를 처리하는 작업을 가정
numbers = range(1, 11)

# 진행바 표시
show_progress_bar(numbers, desc="작업 진행 중", total=len(numbers))
