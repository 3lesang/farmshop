<?php
require 'vendor/autoload.php';
require_once 'src/api/book/BookAPI.php';


$app = new \Slim\App;

// Routes
// all books
$app->get('/books', "getBooks");

// get one book by id
$app->get('/books/{id}', "getBookById");

// adding a book
$app->post('/books', "createBook");

// update a book
$app->put('/books', "updateBook");
// delete a book
$app->delete('/books/{id}', "deleteBook");

$app->run();