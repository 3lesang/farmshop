<?php
class Image_Slider {

    private $id;	
    private $file;	
    private $slider_id;

    public function __get($attr){
      return $this->$attr;
    }

    public function __set($attr, $val){
      return $this->$attr = $val;
    }
    
}