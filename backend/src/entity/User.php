<?php
class User {

    private $id;
    private $full_name  = "";
    private $username = "";
    private $pw = "";
    private $isAdmin;

    public function __get($attr){
      return $this->$attr;
    }

    public function __set($attr, $val){
      return $this->$attr = $val;
    }
}