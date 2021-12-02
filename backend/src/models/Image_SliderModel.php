<?php
include_once 'src/config/DB.php';
class Image_SliderModel 
{
	private $conn;
	private $table = 'image_sliders';

	public function __construct() {
	  $db = new DB();
	  $this->conn = $db->connect();
	}
	public function getAll() {
	  $sql = "SELECT * FROM image_sliders";
	  $stmt = $this->conn->query($sql);
	  $this->conn = null;
	  return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}
}