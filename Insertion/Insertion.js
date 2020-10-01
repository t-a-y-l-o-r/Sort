
/*
 * defines an equals for two arrays
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

// cleaner version
/*
 * Sorts the given array in place
 * using insertion sort.
 * Time: O(n^2)
 * Space: O(1)
 * */
let insertionSort = (array) => {
  if (!Array.isArray(array) || !array.length) {
    return array;
  }
  for (var i = 1; i < array.length; i++) {
    let currentValue = array[i];
    let previousIndex = i - 1;
    let sorting = previousIndex >= 0 && array[previousIndex] > currentValue;
    while (sorting) {
      array[previousIndex + 1] = array[previousIndex];
      previousIndex--;
      sorting = previousIndex >= 0 && array[previousIndex] > currentValue;
    }
    array[previousIndex + 1] = currentValue;

  }
  return array;
};



// generate the random array
let randomArray = [];
while (randomArray.length < 100) {
  var random = Math.floor(Math.random() * 100) + 1;
  if (randomArray.indexOf(random) === -1) {
    randomArray.push(random);
  }
}


// TESTING!
let list = [
  { "unSorted": [], "sorted": []},
  { "unSorted": [1], "sorted": [1]},
  { "unSorted": [2, 1], "sorted": [1, 2]},
  { "unSorted": [3, 2, 1], "sorted": [1, 2, 3]},
  { "unSorted": [5, 3, 4, 1], "sorted": [1, 3, 4, 5]},
  { "unSorted": [...randomArray], "sorted": [...randomArray].sort((a, b) => a - b)}
];


list.forEach(function(entry) {
  let unSorted = entry["unSorted"];
  let sorted = entry["sorted"];
  let should_be = insertionSort([...unSorted]);
  if (!arraysEqual(sorted, should_be)) {
    console.assert(false, `\nun: ${unSorted} \nsorted: ${sorted} \nshould_be ${should_be}`);
  }
});
