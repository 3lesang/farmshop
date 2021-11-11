<?php
require 'vendor/autoload.php';
require_once 'src/api/product/ProductAPI.php';
require_once 'src/api/user/UserAPI.php';
require_once 'auth.php';

$app = new \Slim\App;

// Routes
// all books
$app->get('/products', "getProducts");

// get one product by id
$app->get('/products/{key}', "getProductByKey");

// adding a product
$app->post('/products', "createProduct")->add("isAdmin")->add("isAuth");

// upload image
$app->post('/upload', "upload");//->add("isAdmin")->add("isAuth");

// // update a product
$app->put('/products/{id}', "updateProduct");//->add("isAdmin")->add("isAuth");

// // delete a product
$app->delete('/products/{id}', "deleteProduct")->add("isAdmin")->add("isAuth");

// all users
$app->get('/users', "getUsers");//->add("isAdmin")->add("isAuth");

// // get one user by id
$app->get('/users/{id}', "getUserById")->add("isAdmin")->add("isAuth");

// // adding a user
// $app->post('/users', "createUser");

// login
$app->post('/user/login', "login");

// register
$app->post('/user/register', "register");

// update a user
$app->put('/users', "updateUser")->add("isAuth");


// // delete a user
$app->delete('/users/{id}', "deleteUser")->add("isAdmin")->add("isAuth");
$app->run();