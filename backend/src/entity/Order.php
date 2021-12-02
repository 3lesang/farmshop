<?php
class Order {

	private $id;
	private $order_date;
	private $total_money;
	private $user;
	private $phone;
	private $email;
	private $address;
	private $note;
	private $ship;
	private $vat;
	private $out_money;
	private $discount;
	private $pay_method;
	private $status;
	private $cancel_cancel;
	private $product_quantity;

    public function __get($attr){
      return $this->$attr;
    }

    public function __set($attr, $val){
      return $this->$attr = $val;
    }
    
}