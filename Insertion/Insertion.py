import random

def _insertion_sort(data):
    ''' Uses insertion sort to sort the data in-line
    Time: O(n^2)
    Space: O(1)
    '''
    if not data:
        return data
    for i in range(1, len(data)):
        current = data[i]
        previous_index = i - 1
        sorting = (previous_index >= 0) and data[previous_index] > current
        while sorting:
            data[previous_index + 1] = data[previous_index]
            previous_index -= 1
            sorting = (previous_index >= 0) and data[previous_index] > current
        data[previous_index + 1] = current
    return data


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
            random_list,
            sorted(random_list)

        )
    ]
    for not_sorted, am_sorted in data_set:
        should_be_sorted = _insertion_sort(not_sorted)
        if should_be_sorted != am_sorted:
            print("[*] Test case failed!")
            print(f"[*] un_sorted: {not_sorted}")
            print(f"[*] am_sorted: {am_sorted}")
            print(f"[*] should_be_sorted: {should_be_sorted}")
            assert False
