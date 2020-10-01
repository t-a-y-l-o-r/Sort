import random

def _insertion_sort(data):
    ''' Uses insertion sort to sort the data in-line
    Time: O(n^2)
    Space: O(1)
    '''
    if not data:
        return data
    cursor = 1
    current_val = 0
    still_sorting = cursor < len(data)
    while still_sorting:
        current_val = data[cursor]
        for i, temp_val in enumerate(data[:cursor + 1]):
            if current_val < temp_val:
                data.pop(cursor)
                data.insert(i, current_val)
                break
        cursor += 1
        still_sorting = cursor < len(data)
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
