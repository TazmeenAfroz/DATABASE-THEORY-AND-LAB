<?php

$db_host = 'localhost';
$db_username = 'root';
$db_password = '';
$db_name = 'nutec';


try {
  $conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_username, $db_password);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  echo "Connection failed: ". $e->getMessage();
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $roll_no = $_POST["roll_no"];
  $name = $_POST["name"];
  $email = $_POST["email"];
  $department = $_POST["department"];
  $event = $_POST["event"];


  $sql = "INSERT INTO registrations (roll_no, name, email, department, event) VALUES (?,?,?,?,?)";
  $stmt = $conn->prepare($sql);
  $stmt->execute([$roll_no, $name, $email, $department, $event]);

  echo "Registration successful!";
}


$conn = null;
?>

