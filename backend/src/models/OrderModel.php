<?php
include_once 'src/config/DB.php';
class OrderModel {
    private $conn;
    private $table = 'products';

    public function __construct() {
      $db = new DB();
      $this->conn = $db->connect();
    }
    public function getAll(){
      $sql = "SELECT * FROM orders";
      $stmt = $this->conn->query($sql);
      $this->conn = null;
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }     
}