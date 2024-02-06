<?php

namespace App\config;

use PDO;
use PDOException;

class Database {
    // L'instance unique de la classe
    private static $instance = null;
    private $connexion;

    // Informations de connexion 
    private $host = 'localhost';
    private $database = 'quaiquantique';
    private $username = 'root';
    private $password = '';

    // Constructeur privé pour éviter l'instanciation externe
    private function __construct() {
        try {
            $this->connexion = new PDO("mysql:host=$this->host;dbname=$this->database", $this->username, $this->password);
            // Définir PdoException
            $this->connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $error) {
            echo "Erreur de connexion à la base de données: " . $error->getMessage();
        }
    }

    // Obtention de la classe
    public static function getInstance() {
        if (!self::$instance) {
            self::$instance = new Database();
        }
        return self::$instance;
    }

    // Connxion PDO
    public function getConnexion() {
        return $this->connexion;
    }
}

// Use dataBase
$db = Database::getInstance();
$connexion = $db->getConnexion();
?>