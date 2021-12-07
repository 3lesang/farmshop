<?php
include_once 'src/config/DB.php';
  class OrderModel
  {
    private $conn;
    private $table = 'orders';

    public function __construct() {
      $db = new DB();
      $this->conn = $db->connect();
    }
    public function getAll(){
      $sql = "SELECT * FROM orders";
      $stmt = $this->conn->prepare($sql);
      $stmt->execute();

      $this->conn = null;
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function add($data){
      $sql = "INSERT INTO orders(order_date, total_money, user, phone, email, address, note, ship, vat, out_money, discount, pay_method, status, cancel_cancel, product_quantity) Values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      $stmt = $this->conn->prepare($sql);

      try {
        $this->conn->beginTransaction();
        $stmt->execute([NULL, $data['totalPrice'], NULL, NULL, NULL, $data['shipping']['address'], NULL, $data['shippingPrice'], NULL, NULL, NULL, NULL, NULL, NULL, NULL]);

        $id = $this->conn->lastInsertId();
        $this->conn->commit();

        return $id;
        
	  } catch(PDOExecption $e) {
	        $this->conn->rollback();
	        return ['error' => $e->getMessage()];
	    }       
    }
   
    public function update(Order $order){
      $sql = "UPDATE products SET name=:name, code=:code, title=:title, detail=:detail, image_display=:image, price=:price WHERE id = :id";
      

      $stmt = $this->conn->prepare($sql);

      $res = $stmt->execute(array(
      	':id' => $order->__get('id'),
      	':name' => $order->__get('name'),
      	':code' => $order->__get('code'),
      	':title' => $order->__get('title'),
      	':detail' => $order->__get('detail'),
      	':image' => $order->__get('image_display'),
      	':price' => $order->__get('price'),
  		));      
  }       
   
    public function delete($id){
      $sql = "DELETE FROM orders WHERE id= :id";
      
      $stmt = $this->conn->prepare($sql);      
      $res = $stmt->execute(array( ":id" => $id ));      
  	}
  	public function countOrder() {
        $sql = "SELECT COUNT(id) AS total FROM orders";
        
        $stmt = $this->conn->query($sql);     
        $res = $stmt->fetch(PDO::FETCH_ASSOC);  
        return $res;
    }

    public function totalMoney() {
        $sql = "SELECT sum(total_money) as sales FROM orders";
        
        $stmt = $this->conn->query($sql);     
        $res = $stmt->fetch(PDO::FETCH_ASSOC);  
        return $res;
    }
    public function dailyOrders() {
        $sql = "SELECT * from orders";
        
        $stmt = $this->conn->query($sql);     
        $res = $stmt->fetchAll(PDO::FETCH_ASSOC);  
        return $res;
    }
           
}