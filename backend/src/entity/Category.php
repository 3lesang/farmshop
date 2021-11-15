<?php
class Category {

    private $id;	
    private $name;	
    private $code;

    public function __get($attr){
      return $this->$attr;
    }

    public function __set($attr, $val){
      return $this->$attr = $val;
    }
    
}