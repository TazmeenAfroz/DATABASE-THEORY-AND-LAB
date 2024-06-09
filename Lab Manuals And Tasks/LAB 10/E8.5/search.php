<?php
// Configuration
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
  $search_by = $_POST["search_by"];
  $search_data = $_POST["search_data"];

 
  $sql = "SELECT * FROM registrations WHERE $search_by =?";
  $stmt = $conn->prepare($sql);
  $stmt->execute([$search_data]);
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);


  echo "<h2>Search Results</h2>";
  foreach ($result as $row) {
    echo "Roll No: ". $row['roll_no']. ", Name: ". $row['name']. ", Email: ". $row['email']. ", Department: ". $row['department']. ", Event: ". $row['event']. "<br>";
  }
}


$conn = null;
?>

