
/*
 * defines an equals for the array obj
 * */
const arraysEqual = (array1, array2) => {
  if (!Array.isArray(array1) || !Array.isArray(array2)) {
    return false;
  }
  if (array1.length != array2.length) {
    return false;
  }
  for (let i = 0, last = array1.length; i < last; i++) {
    if (array1[i] instanceof Array && array2[i] instanceof Array) {
      // recursively check
      if (!array1[i].equals(array2[i])) {
        return false;
      }
    } else if (array1[i] != array2[i]) {
      return false;
    }
  }
  return true;
}


/*
 * Sorts the given array in place
 * using insertion sort.
 * Time: O(n^2)
 * Space: O(1)
 * */
let insertionSort = (data) => {
  if (!Array.isArray(data) || !data.length) {
    return data;
  }
  return data;
}



let list = [
  { "unSorted": [], "sorted": []},
  { "unSorted": [1], "sorted": [1]},
  { "unSorted": [2, 1], "sorted": [1, 2]},
  { "unSorted": [3, 2, 1], "sorted": [1, 2, 3]}
];


list.forEach(function(entry) {
  let unSorted = entry["unSorted"];
  let sorted = entry["sorted"];
  let should_be = insertionSort(unSorted);
  if (!arraysEqual(sorted, should_be)) {
    console.assert(false, `\nun: ${unSorted} \nsorted: ${sorted} \nshould_be ${should_be}`);
  }
});
console.log(arraysEqual([], []));
