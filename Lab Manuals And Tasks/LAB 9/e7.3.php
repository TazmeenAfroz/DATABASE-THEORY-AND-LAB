<?php
$username = "root";
$password = "";
try {
    $conn = new PDO("mysql:host=localhost;dbname=THEME_PARK", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    if(isset( $_GET['PARK_CODE']) && isset($_GET['PARK_NAME']) && isset($_GET['PARK_CITY']) && isset($_GET['PARK_COUNTRY'])) {
        $park_code = $_GET['PARK_CODE'];
        $park_name = $_GET['PARK_NAME'];
        $park_city = $_GET['PARK_CITY'];
        $park_country = $_GET['PARK_COUNTRY'];
        
        try {
            $stmt = $conn->prepare("INSERT INTO THEMEPARK (PARK_CODE, PARK_NAME, PARK_CITY, PARK_COUNTRY) VALUES (:park_code, :park_name, :park_city, :park_country)");
            $stmt->bindParam(':park_code', $park_code);
            $stmt->bindParam(':park_name', $park_name);
            $stmt->bindParam(':park_city', $park_city);
            $stmt->bindParam(':park_country', $park_country);
            $stmt->execute();

            echo "<p>Record inserted successfully</p>";

            // Redirect back to the HTML form
            // header("Location: theme_park_form.html");
            exit;
        } catch(PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}
?>
