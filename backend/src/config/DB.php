<?php
        define('DB_HOST', 'localhost');
        define('DB_NAME', 'farmshop2');
        define('DB_USER', 'sang');
        define('DB_PASSWORD', 'amsang2403');
    class DB {
        // private $host = 'localhost';
        // private $db_name = 'myblog';
        // private $username = 'sang';
        // private $password = 'amsang2403';
        private $conn;

        public function connect(){
            $this->conn = null;
            $connect_str = "mysql:host=".DB_HOST.";dbname=".DB_NAME;
            try { 
                $this->conn = new PDO($connect_str, DB_USER, DB_PASSWORD);                
                $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch(PDOException $e) {
                echo 'Connection Error: ' . $e->getMessage();
            }
      
            return $this->conn;
          }

    }