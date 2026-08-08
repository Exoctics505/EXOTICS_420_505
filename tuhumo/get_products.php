<?php
// Permitir peticiones desde el frontend y definir respuesta JSON
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=utf-8');

// Datos de conexión a MySQL (Ajusta según tu servidor/XAMPP)
$host = 'localhost';
$user = 'root';     // Tu usuario de MySQL
$pass = '';         // Tu contraseña de MySQL
$dbname = 'tuhumo_db';

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error al conectar con la Base de Datos"]);
    exit;
}

// Configurar codificación UTF-8
$conn->set_charset("utf8");

// Consultar productos
$sql = "SELECT id, categoria, nombre, CAST(precio AS FLOAT) AS precio, imagen_url AS img FROM productos ORDER BY id DESC";
$result = $conn->query($sql);

$productos = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $productos[] = $row;
    }
}

// Devolver la respuesta en JSON
echo json_encode([
    "status" => "success",
    "total" => count($productos),
    "productos" => $productos
]);

$conn->close();
?>