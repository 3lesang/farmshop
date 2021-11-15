<?php
require 'src/models/CategoryModel.php';
require 'src/models/OrderModel.php';
function getSummary($request, $response) {    
  try {
    // picking users from database 
    $userModel = new UserModel();
    $categoryModel = new CategoryModel();
    $orderModel = new OrderModel();
    $users = $userModel->countUser();
    $categories = $categoryModel->getAll();
    $orders = $orderModel->getAll();
    $data = [
    	'user' => $users,
    	'category' => $categories,
    	'order' => $orders
    ];

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($data);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }
}
