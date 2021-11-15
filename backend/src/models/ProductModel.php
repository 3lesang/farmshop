<?php
include_once 'src/config/DB.php';
  class ProductModel 
  {
    private $conn;
    private $table = 'products';

    public function __construct() {
      $db = new DB();
      $this->conn = $db->connect();
    }
    public function getAll($searchQuery){
      $sql = "SELECT * FROM products WHERE name LIKE :keyword;";
      $stmt = $this->conn->prepare($sql);
      $stmt->bindValue(':keyword','%'.$searchQuery.'%');
      $stmt->execute();

      $this->conn = null;
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function findByKey($key) {
      $sql = "SELECT * FROM products WHERE id=:id OR code=:code";

      $stmt = $this->conn->prepare($sql);
      $stmt->execute([':id' => $key, ':code' => $key]);

      $this->conn = null;
      return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function add(){
      $sql = "INSERT INTO products(name, code, title, detail) Values (?, ?, ?, ?)";
      $stmt = $this->conn->prepare($sql);

      try {
        $this->conn->beginTransaction();
        $stmt->execute(['sample', 'sample', 'sample', 'sample']);

        $id = $this->conn->lastInsertId();
        $this->conn->commit();

        return $id;
        
	  } catch(PDOExecption $e) {
	        $this->conn->rollback();
	        return ['error' => $e->getMessage()];
	    }       
    }
   
    public function update(Product $product){
      $sql = "UPDATE products SET name=:name, code=:code, title=:title, detail=:detail, image_display=:image, price=:price WHERE id = :id";
      

      $stmt = $this->conn->prepare($sql);

      $res = $stmt->execute(array(
      	':id' => $product->__get('id'),
      	':name' => $product->__get('name'),
      	':code' => $product->__get('code'),
      	':title' => $product->__get('title'),
      	':detail' => $product->__get('detail'),
      	':image' => $product->__get('image_display'),
      	':price' => $product->__get('price'),
  		));      
  }       
   
    public function delete($id){
      $sql = "DELETE FROM products WHERE id= :id";
      
      $stmt = $this->conn->prepare($sql);      
      $res = $stmt->execute(array( ":id" => $id ));      
  }       
  }