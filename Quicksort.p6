=begin comment
Author: Taylor Cochran
goal: To implement quickSort in perl 6:
=end comment


sub quickSort (@myArray) {
  my $start = 0;
  my $end = @myArray.Int - 1;
  qSort(@myArray, $start, $end);
}

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

sub swap(@myArray, Int $left, $right){
  my $temp = @myArray[$left];
  @myArray[$left] = @myArray[$right];
  @myArray[$right] = $temp;
}


sub MAIN{
  # my @myArray = 3, 2, 1, 1, 2;

  # my @myArray = 1, 2, 3, 4, 5, 6;
  # my @myArray = 6, 5, 4, 3, 2, 1;
  # my @myArray = 1, 2, 3, 1, 2, 3;
  # my @myArray = 3, 2, 1, 3, 2, 1;
  # my @myArray = 1, 2, 3, 3, 2, 1;
  # my @myArray = 3, 2, 1, 1, 2, 3;
  # my @myArray = 1, 6, 2, 5, 3, 4;
  # my @myArray = 6, 1, 5, 2, 4, 3;
  # my @myArray = 4, 3, 5, 2, 6, 1;
  # my @myArray = 3, 4, 2, 5, 1, 6;
  # my @myArray = 1, 1, 2, 2, 3, 3;
  # my @myArray = 3, 3, 2, 2, 1, 1;
  # my @myArray = 2, 2, 1, 1, 3, 3;
  # my @myArray = 3, 3, 1, 1, 2, 2;

  # my @myArray = 1, 2, 3, 4, 5;
  # my @myArray = 6, 5, 4, 3, 2;
  # my @myArray = 1, 2, 3, 1, 2;
  # my @myArray = 3, 2, 1, 3, 2;
  # my @myArray = 1, 2, 3, 3, 2;
  # my @myArray = 3, 2, 1, 1, 2;
  # my @myArray = 6, 2, 5, 3, 4;
  # my @myArray = 1, 5, 2, 4, 3;
  # my @myArray = 4, 3, 5, 2, 6;
  # my @myArray = 3, 4, 2, 5, 1;
  # my @myArray = 1, 1, 2, 2, 3;
  # my @myArray = 3, 3, 2, 2, 1;
  # my @myArray = 2, 2, 1, 1, 3;
  my @myArray = 3, 3, 1, 1, 2; #`(
  )

  say @myArray;
  @myArray = quickSort(@myArray);
  say @myArray;
}
