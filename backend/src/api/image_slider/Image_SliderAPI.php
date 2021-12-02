<?php
require 'src/models/Image_SliderModel.php';
require 'src/entity/Image_Slider.php';
function getImage_Sliders($request, $response) {    
  try {
  	$key = 'q';
  	$searchQuery = $request->getQueryParam($key, $default = null);
    // picking products from database 
    $image_SliderModel = new Image_SliderModel();
    $image_sliders = $image_SliderModel->getAll($searchQuery);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($image_sliders);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }
};