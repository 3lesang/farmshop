<?php
define('KEY', 'farm');
use Firebase\JWT\JWT;
use Firebase\JWT\Key;


function generateToken(User $user) {
    $payload = array(
        "id" => $user->__get('id'),
        "full_name" => $user->__get('full_name'),
        "username" => $user->__get('username'),
        "isAdmin" => $user->__get('isAdmin')
    );
    $jwt = JWT::encode($payload, KEY, 'HS256');
    return $jwt;
}

function isAuth($request, $response, $next) {
    $bearerToken = $request->getHeader('Authorization');
    $token = explode(' ', $bearerToken[0])[1];
    if (!$token) {
        $response->withStatus(401);
        $message['message'] = 'Token is not supplied';
        $response->withHeader('Content-Type', 'application/json');
        return $response->withJson($message);
    } else {
        try{
            $decoded = JWT::decode($token, new Key(KEY, 'HS256'));
        } catch(Exception $e) {

        }
        try {
            if(!is_object($decoded)) {
                $message['message'] = 'Invalid Token';
                $response->withHeader('Content-Type', 'application/json');
                return $response->withJson($message, 401);
            } else {
                $request = $request->withAttribute('user', $decoded);
                return $next($request, $response);
                // $response = $next($request, $response);
                // return $response;
            }
        } catch(Exception $e) {
            $response->withStatus(500);
            $response->withHeader('Content-Type', 'application/json');
            $error['err'] = $e->getMessage(); 
            return $response->withJson($error);
        }
    }
};
function isAdmin($request, $response, $next) {
    $user = $request->getAttribute('user');

    if ($user->isAdmin) {
        $response = $next($request, $response);
        return $response;
    } else {
        echo $user->isAdmin;
        $message['message'] = 'Token is not valid for admin user';
        $response->withHeader('Content-Type', 'application/json');
        return $response->withJson($message, 401);
    }
};

