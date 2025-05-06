<?php
// Database connection script using RDS credentials
$host = 'your-rds-endpoint.amazonaws.com';
$db   = 'ecommerce';
$user = 'admin';
$pass = 'your-password';
$port = '3306';

// Enabling SSL for encrypted connection
$ssl_cert = '/path/to/rds-combined-ca-bundle.pem';

$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, $ssl_cert, NULL, NULL);
mysqli_real_connect($conn, $host, $user, $pass, $db, $port, NULL, MYSQLI_CLIENT_SSL);

// Check connection
if (mysqli_connect_errno($conn)) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
