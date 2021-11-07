<?php
class User {

    private $id;
    private $name  = "";
    private $username = "";
    private $password = "";
    private $token = "";
    private $isAdmin = "";

    public function __get($attr){
      return $this->$attr;
    }

    public function __set($attr, $val){
      return $this->$attr = $val;
    }
}