///
fn main() -> Result<(), std::io::Error>{
  let mut vec = vec![1, 2, 3, 3, 2, 1];
  let mut current_val;
  let mut still_sorting;
  let mut previous_index;
  for i in 1..vec.len() {
    current_val = vec[i];
    previous_index = (i as i8) - 1;
    still_sorting = previous_index >= 0;
    if still_sorting {
      still_sorting = vec[previous_index as usize] > current_val;
    }
    while still_sorting {
      vec[(previous_index as usize) + 1] = vec[previous_index as usize];
      previous_index -= 1;
      still_sorting = previous_index >= 0;
      if still_sorting {
        still_sorting = vec[previous_index as usize] > current_val;
      }
    }
    if previous_index >= 0 {
      vec[(previous_index as usize) + 1] = current_val;
    }
  }
  println!("{:?}", vec);
  Ok(())
}
