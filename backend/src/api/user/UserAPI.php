<?php
require 'src/models/UserModel.php';
require 'src/entity/User.php';
function getUsers($request, $response) {    
  try {
    // picking users from database 
    $userModel = new UserModel();
    $users = $userModel->getAll();

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($users);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }
}

function getUserById($request, $response) {
  try {
    $id = $request->getAttribute('id');

    // picking a book
    $userModel = new UserModel();
    $user = $userModel->findById($id);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($user);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage(); 
    return $response->withJson($error);
  }
};
function createUser($request, $response) { 
  try {
    $user = new User();    
    $user->__set('full_name', $request->getParam('full_name'));
    $user->__set('username', $request->getParam('username'));
    $user->__set('pw', $request->getParam('pw'));

    // adding book in db
    $userModel = new UserModel();
    $userModel->add($user);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    $message['ok'] = "User added successfully";
    return $response->withJson($message);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage(); 
    return $response->withJson($error);
  }
};

function updateUser($request, $response) { 
  try {
        $json = $request->getBody();
        $data = json_decode($json, true);
        $user = new User();
        $user->__set('id', $data['id']);
        $user->__set('full_name', $data['full_name']);
        $user->__set('username', $data['username']);
        $user->__set('pw', $data['pw']);


        // updating book in db
        $userModel = new UserModel();
        $userModel->update($user);

        // custom json response
        $response->withStatus(200);
        $response->withHeader('Content-Type', 'application/json');
        $message['ok'] = "User updated successfully";
        return $response->withJson($message);

  } catch (PDOException $e) {
        $response->withStatus(500);
        $response->withHeader('Content-Type', 'application/json');
        $error['err'] = $e->getMessage(); 
        return $response->withJson($error);
  }
};

function deleteUser($request, $response) { 
  try {
    $id = $request->getAttribute('id');
    
    // delete user from database 
    $userModel = new UserModel();
    $userModel->delete($id);

    // custom json response
    $response->withStatus(200);
    $response->withHeader('Content-Type', 'application/json');
    $message['ok'] = "User deleted successfully";
    return $response->withJson($message);

  } catch (PDOException $e) {
    $response->withStatus(500);
    $response->withHeader('Content-Type', 'application/json');
    $error['err'] = $e->getMessage();
    return $response->withJson($error);
  }
};


function login($request, $response) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true);
        $userModel = new UserModel();
        $res = $userModel->login($data['username'], $data['pw']);
      if($res) {
              // custom json response
            $user = new User();
            $user->__set('full_name', $res->full_name);
            $user->__set('username', $res->username);
            $user->__set('isAdmin', $res->isAdmin);
            $data = array(
                'id' => $res->id,
                'full_name'=> $res->full_name,
                'username' => $res->username,
                'token' => generateToken($user),
                'isAdmin'=> $res->isAdmin
            );
            $response->withStatus(200);
            $response->withHeader('Access-Control-Allow-Origin', '*');
            $response->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization');
            $response->withHeader('Access-Control-Allow-Methods', 'POST');
            $response->withHeader('Content-Type', 'application/json');
            return $response->withJson($data);
      } else {
        return $response->withJson(['mess' => 'login fail']);
      }
  
    } catch (PDOException $e) {
        $response->withStatus(500);
        $response->withHeader('Content-Type', 'application/json');
        $response->withHeader('Access-Control-Allow-Origin', '*');
        $error['err'] = $e->getMessage(); 
        return $response->withJson($error);
    }
};

function register($request, $response) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true);
        $userModel = new UserModel();
        $user = new User();
        $user->__set('full_name', $data['full_name']);
        $user->__set('username', $data['username']);
        $user->__set('pw', $data['pw']);
        $user->__set('isAdmin', 0);
        $userModel = new UserModel();
        $res = $userModel->add($user);
      if($res) {
              // custom json response
            $response->withStatus(200);
            $response->withHeader('Access-Control-Allow-Origin', '*');
            $response->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization');
            $response->withHeader('Access-Control-Allow-Methods', 'POST');
            $response->withHeader('Content-Type', 'application/json');
            return $response->withJson(['mess' => 'user created successfully']);
      }
  
    } catch (PDOException $e) {
        $response->withStatus(500);
        $response->withHeader('Content-Type', 'application/json');
        $error['err'] = $e->getMessage(); 
        return $response->withJson($error);

    }
};
