<?php
class Product {

    private $id;	
    private $name;	
    private $code;	
    private $title;	
    private $image_display;	
    private $detail;	
    private $related_images;	
    private $review;	
    private $bestseller;	
    private $trending;	
    private $new;	
    private $price;	
    private $discount;	
    private $created_at;	
    private $modify_at;	
    private $supplier_id;	
    private $categories_id;	
    private $user_created_id;	
    private $user_update_id;

    public function __get($attr){
      return $this->$attr;
    }

    public function __set($attr, $val){
      return $this->$attr = $val;
    }
    
}