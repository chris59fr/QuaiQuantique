<?php

try{
  $bdd = new PDO('mysql:dbname=quaiquantique;host=localhost;charset=utf8mb4', 'root', '');
  $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  //attr errmode crer un rapport d'erreur et emet une execption pour lancer une issu (catch)
  echo "Connexion réussie";
}
catch(PDOException $e) {
  echo "Erreur : " . $e->getMessage();
}


