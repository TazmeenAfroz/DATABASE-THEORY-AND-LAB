<!-- Write a script to find sum of the numbers given as a string.
$input = “1,2,3,4,5,6,7”; -->

<?php
$input = "1,2,3,4,5,6,7";
$input = str_replace(",", "", $input);
$numbers = str_split($input);
$sum = 0;
foreach ($numbers as $number) {
    $sum += $number;
}
echo "Sum of the numbers is: $sum";
?>
