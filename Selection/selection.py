import random
import copy

def _selection_sort(input_arr: [int]) -> [int]:
    if not input_arr or len(input_arr) <= 1:
        return input_arr
    smallest = {
        "index": 0,
        "val": 0
    }
    for sorted_boundary, left_most_value in enumerate(input_arr):
        smallest["val"] = left_most_value
        smallest["index"] = sorted_boundary
        for inner_index, inner_val in enumerate(input_arr[sorted_boundary:]):
            if inner_val < smallest["val"]:
                smallest["val"] = inner_val
                # adjust real index for shifting slice
                smallest["index"] = inner_index + sorted_boundary
        # swap
        input_arr[smallest["index"]], input_arr[sorted_boundary] = \
            input_arr[sorted_boundary], input_arr[smallest["index"]]
    return input_arr

if __name__ == "__main__":
    random_list = random.sample(range(1, 10000), 100)
    data_set = [
        (
            [],
            []
        ),
        (
            [1],
            [1]
        ),
        (
            [2, 1],
            [1, 2]
        ),
        (
            [3, 2, 1],
            [1, 2, 3]
        ),
        (
            [4, 2, 3, 1],
            [1, 2, 3, 4]
        ),
        (
            [4, 5, 2, 3, 1],
            [1, 2, 3, 4, 5]
        ),
        (
            random_list,
            sorted(random_list)
        )
    ]
    for not_sorted, am_sorted in data_set:
        should_be_sorted = _selection_sort(copy.copy(not_sorted))
        if should_be_sorted != am_sorted:
            print("[*] Test case failed!")
            print(f"[*] un_sorted: {not_sorted}")
            print(f"[*] am_sorted: {am_sorted}")
            print(f"[*] should_be_sorted: {should_be_sorted}")
            assert False

