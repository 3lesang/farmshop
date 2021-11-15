<?php
include_once 'src/config/DB.php';
  class UserModel 
  {
    private $conn;
    private $table = 'users';

    public function __construct() {
        $db = new DB();
        $this->conn = $db->connect();
    }
    public function getAll(){
        $sql = "SELECT * FROM users";

        $stmt = $this->conn->query($sql);

        $this->conn = null;
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function findById(int $id){
        $sql = "SELECT * FROM users WHERE id=$id";

        $stmt = $this->conn->query($sql);

        $this->conn = null;
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function login($username, $pw) {
        $sql = "SELECT * FROM users WHERE username=:username and pw=:pw";        

        try {
        	$stmt = $this->conn->prepare($sql);
	        $stmt->execute(['username' => $username, 'pw' => $pw]); 

        	$user = $stmt->fetch(PDO::FETCH_OBJ);
        	$this->conn = null;
	        return $user;
        
	  	} catch(PDOExecption $e) {
	        return ['error' => $e->getMessage()];
	    }       

    }
    public function add(User $user) {
        $sql = "INSERT INTO users(username, pw, isAdmin, full_name) Values (:username, :pw, :isAdmin, :full_name)";
        $stmt = $this->conn->prepare($sql);
        
        try {
	        $this->conn->beginTransaction();

	        $stmt->execute(array(
	            ":full_name" => $user->__get('full_name'),
	            ":username" => $user->__get('username'),
	            ":pw" => $user->__get('pw'),
	            ":isAdmin" => $user->__get('isAdmin')
	            )
	        );
	        $id = $this->conn->lastInsertId();
	        $this->conn->commit();
	        $this->conn = null;
	        return $id;
        
	  	} catch(PDOExecption $e) {
	        $this->conn->rollback();
	        return ['error' => $e->getMessage()];
	    }       

    }
   
    public function update(User $user) {
        $sql = "UPDATE users SET full_name = :full_name, username = :username, pw = :pw WHERE id = :id";

        $stmt = $this->conn->prepare($sql);

        $res = $stmt->execute(array(
            ":id" => $user->__get('id'),
            ":full_name" => $user->__get('full_name'),
            ":username" => $user->__get('username'),
            ":pw" => $user->__get('pw'),
            )
        );
        $this->conn = null;
    }       
   
    public function delete($id){
        $sql = "DELETE FROM users WHERE id= :id";
        
        $stmt = $this->conn->prepare($sql);     
        $res = $stmt->execute(array( ":id" => $id ));
        $this->conn = null;  
    }       
    public function countUser() {
        $sql = "SELECT COUNT(username) AS total FROM users";
        
        $stmt = $this->conn->query($sql);     
        $res = $stmt->fetch(PDO::FETCH_ASSOC);  
        return $res;
    }  

}