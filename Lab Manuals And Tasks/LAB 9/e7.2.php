<!-- 7.2 Remove the last occurrence of “89” from the following string.
$input = “A89C89”; -->
<?php
$input = "A89C89";
// rtrim() function is used to remove the last occurrence of a character or characters from a string.
$input = rtrim($input, "89");
echo "New string is: $input";
?>