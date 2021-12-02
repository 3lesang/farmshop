<?php
class Supplier {

    private $id;
    private $name  = "";
    private $code = "";
    private $address = "";
    private $phone = "";

    public function __get($attr){
      return $this->$attr;
    }

    public function __set($attr, $val){
      return $this->$attr = $val;
    }
}