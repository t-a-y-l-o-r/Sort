=begin comment
Author: Taylor Cochran
goal: To implement quickSort in perl 6:
=end comment


=begin comment
sorts the passed array from start to end
=end comment
sub quickSort (@myArray) {
  my $start = 0;
  my $end = @myArray.Int - 1;
  qSort(@myArray, $start, $end);
}

=begin comment
Using divide & conquor recursively quick sorts the array
=end comment
sub qSort (@myArray, Int $start is rw, Int $end is rw) {
  my $left = $start;
  my $right = $end;
  my $size = $end - $start + 1;
  my $pivot = ( (@myArray[$end] + @myArray[$start] +
                @myArray[$start + ($size / 2)] )
              / 3);
  while ($left <= $right) {
    while (@myArray[$left] < $pivot) {
      $left++;
    }
    while (@myArray[$right] > $pivot) {
      $right--;
    }
    if ($left <= $right) {
      swap(@myArray, $left, $right);
      $left++;
      $right--;
    }
  }
  if ($start < $right) {
    qSort(@myArray, $start, $right);
  }
  if ($left < $end) {
    qSort(@myArray, $left, $end);
  }
  @myArray;
}

=begin comment
Swaps the values at the fiven positions
=end comment
sub swap(@myArray, Int $left, Int $right){
  my $temp = @myArray[$left];
  @myArray[$left] = @myArray[$right];
  @myArray[$right] = $temp;
}
