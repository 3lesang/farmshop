<?php
include_once 'src/config/DB.php';
  class BookModel 
  {
    private $conn;
    private $table = 'product';

    public function __construct() {
      $db = new DB();
      $this->conn = $db->connect();
    }
    public function getAll(){
      $sql = "SELECT id, title, author, book_description FROM books";

      $stmt = $this->conn->query($sql);

      $this->conn = null;
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function findById(int $id){
      $sql = "SELECT id, title, author, book_description FROM books WHERE id=$id";

      $stmt = $this->conn->query($sql);

      $this->conn = null;
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function add(Book $book){
      $sql = "INSERT INTO books Values (default, :title, :author, :book_description)";
      
      $stmt = $this->conn->prepare($sql);

      $res = $stmt->execute(array(
         ":title" => $book->__get('title'),
         ":author" => $book->__get('author'),
         ":book_description" => $book->__get('description'),
        )
      );      
    }
   
    public function update(Book $book){
      $sql = "UPDATE books SET title = :title, author = :author, book_description = :book_description WHERE id = :id";
      

      $stmt = $this->conn->prepare($sql);

      $res = $stmt->execute(array(
         ":id" => $book->__get('id'),
         ":title" => $book->__get('title'),
         ":author" => $book->__get('author'),
         ":book_description" => $book->__get('description'),
        )
      );      
  }       
   
    public function delete($id){
      $sql = "DELETE FROM books WHERE id= :id";
      
      $stmt = $this->conn->prepare($sql);      
      $res = $stmt->execute(array( ":id" => $id ));      
  }       
  }