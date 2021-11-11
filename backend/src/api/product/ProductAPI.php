<?php
// use \Psr\Http\Message\ServerRequestInterface as Request;
// use \Psr\Http\Message\ResponseInterface as Response;
require 'src/models/ProductModel.php';
require 'src/entity/Product.php';
function getProducts($request, $response) {    
  try {
  	$key = 'q';
  	$searchQuery = $request->getQueryParam($key, $default = null);
    // picking products from database 
    $productModel = new ProductModel();
    $products = $productModel->getAll($searchQuery);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($products);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }
}

function getProductByKey($request, $response) {
  try {
    $key = $request->getAttribute('key');

    // picking a product
    $productModel = new ProductModel();
    $product = $productModel->findByKey($key);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($product);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage(); 
    return $response->withJson($error);
  }
};
function createProduct($request, $response) { 
  try {

    // adding product in db
    $productModel = new ProductModel();
    $data = $productModel->add();

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
};

function updateProduct($request, $response) { 
  try {
  	$id = $request->getAttribute('id');
  	$json = $request->getBody();
    $data = json_decode($json, true);
    $product = new Product();
    $product->__set('id', $id);
    $product->__set('name', $data['name']);
    $product->__set('code', $data['code']);
    // $product->__set('title', $data['title']);
    $product->__set('image_display', $data['image_display']);
    $product->__set('detail', $data['detail']);
    $product->__set('price', $data['price']);

    // updating product in db
    $productModel = new ProductModel();
    $productModel->update($product);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    $message['ok'] = "Product updated successfully";
    return $response->withJson($message);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage(); 
    return $response->withJson($error);
  }
};

function deleteProduct($request, $response) { 
  try {
    $id = $request->getAttribute('id');
    
    // delete product from database 
    $productModel = new ProductModel();
    $productModel->delete($id);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    $message['ok'] = "product deleted successfully";
    return $response->withJson($message);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }
};