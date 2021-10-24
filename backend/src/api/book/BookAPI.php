<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
require 'src/models/BookModel.php';
require 'src/entity/Book.php';
function getBooks(Request $request, Response $response) {    
  try {
    // picking books from database 
    $bookModel = new BookModel();
    $books = $bookModel->getAll();

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($books);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }
}

function getBookById(Request $request, Response $response) {
  try {
    $id = $request->getAttribute('id');

    // picking a book
    $bookModel = new BookModel();
    $book = $bookModel->findById($id);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($book);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage(); 
    return $response->withJson($error);
  }
};
function createBook(Request $request, Response $response) { 
  try {
    $book = new Book();    
    $book->__set('title', $request->getParam('title'));
    $book->__set('author', $request->getParam('author'));
    $book->__set('description', $request->getParam('book_description'));

    // adding book in db
    $bookModel = new BookModel();
    $bookModel->add($book);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    $message['ok'] = "Book added successfully";
    return $response->withJson($message);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage(); 
    return $response->withJson($error);
  }
};

function updateBook(Request $request, Response $response) { 
  try {

    $book = new Book();
    $book->__set('id', $request->getParam('id'));
    $book->__set('title', $request->getParam('title'));
    $book->__set('author', $request->getParam('author'));
    $book->__set('book_description', $request->getParam('description'));


    // updating book in db
    $bookModel = new BookModel();
    $bookModel->update($book);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    $message['ok'] = "Book updated successfully";
    return $response->withJson($message);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage(); 
    return $response->withJson($error);
  }
};

function deleteBook(Request $request, Response $response) { 
  try {
    $id = $request->getAttribute('id');
    
    // delete book from database 
    $bookModel = new BookModel();
    $bookModel->delete($id);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    $message['ok'] = "Book deleted successfully";
    return $response->withJson($message);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }
};