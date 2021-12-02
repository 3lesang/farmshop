<?php
require 'src/models/SupplierModel.php';
require 'src/entity/Supplier.php';
function getSuppliers($request, $response) {    
  try {
  	$key = 'q';
  	$searchQuery = $request->getQueryParam($key, $default = null);
    // picking products from database 
    $supplierModel = new SupplierModel();
    $suppliers = $supplierModel->getAll($searchQuery);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($suppliers);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }

  function getSupplierByKey($request, $response) {
    try {
      $key = $request->getAttribute('key');
  
      // picking a product
      $supplierModel = new SupplierModel();
      $supplier = $supplierModel->findByKey($key);
  
      // custom json response
      $response->withStatus(200);
      $response->withHeader('Content-Type', 'application/json');
      return $response->withJson($supplier);
  
    } catch (PDOException $e) {
      $response->withStatus(500);
      $response->withHeader('Content-Type', 'application/json');
      $error['err'] = $e->getMessage(); 
      return $response->withJson($error);
    }
  };
};