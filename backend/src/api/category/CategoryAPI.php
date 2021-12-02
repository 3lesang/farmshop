<?php
//require 'src/models/CategoryModel.php';
//require 'src/entity/Category.php';
function getCategories($request, $response) {    
  try {
  	$key = 'q';
  	$searchQuery = $request->getQueryParam($key, $default = null);
    // picking products from database 
    $categoryModel = new CategoryModel();
    $categories = $categoryModel->getAll($searchQuery);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($categories);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }
};

function getCategoryByKey($request, $response) {
  try {
    $key = $request->getAttribute('key');

    // picking a product
    $categoryModel = new CategoryModel();
    $category = $categoryModel->findByKey($key);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($category);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage(); 
    return $response->withJson($error);
  }
};