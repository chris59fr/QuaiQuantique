<?php

session_start(); // Démarrer la session
header('Content-Type: text/html; charset=utf-8'); // Configurer l'en-tête

try {
    $requestUri = $_SERVER['REQUEST_URI'];
    $method = $_SERVER['REQUEST_METHOD'];

    // Simplification du routage basé sur l'URI et la méthode HTTP
    if ($method == 'GET' && $requestUri == '/login') {

    } elseif ($method == 'POST' && $requestUri == '/login') {

    } else {
        // Page 404 ou rediriger vers la page d'accueil
    }
} catch (Exception $e) {
    error_log($e->getMessage());
    http_response_code(500);
    echo "Une erreur est survenue.";
}
