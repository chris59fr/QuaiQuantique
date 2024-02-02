<?php

require_once('D:\ENV\Logiciel\XAMPP\htdocs\QuaiQuantique\Back\config\Database.php');

class RoleModel {

  private $id_role;
  private $name_role;
  private $connexion;

  public function __construct($id_role = null, $name_role= null)
  {
    $this->id_role = $id_role;
    $this->name_role = $name_role;
  }

  //connexion BDD
  private function getDBConnection() {
    return Database::getConnection();
  }


  //ajouter un role
  public function insert() {

    $db = $this->getDBConnection();

    try {

      $requetes = $db->prepare('INSERT INTO `role`(`name_role`) VALUES (:$name_role)');
      $requetes->bindParam(':name_role', $this->name_role);
      $requetes->execute();

    } catch (PDOException $erreur) {
      
      echo "Erreur d'insertion : " . $erreur->getMessage();
    }
  }


  //lecture des role en fonction des user
  public function select() {

    $db = $this->getDBConnection();

    try {

      $requetes = $db->prepare('SELECT `name_role` FROM `role`');
      $requetes->execute();

    } catch (PDOException $erreur) {

      echo "Erreur de selection : " . $erreur->getMessage();
    }
  }


  //changer les role 
  public function update() {

    $db = $this->getDBConnection();

    try {

      $requetes = $db->prepare('UPDATE `role` SET `name_role` = :name_role WHERE `id_role` = :id_role');
      $requetes->bindParam(':name_role', $this->name_role);
      $requetes->bindParam(':id_role', $this->id_role);
      $requetes->execute();

    } catch (PDOException $erreur) {

      echo "Erreur d'update : " . $erreur->getMessage();
    }
  }


  //supp un role
  public function delete() {

    $db = $this->getDBConnection();

    try {

      $requetes = $db->prepare('DELETE FROM `role` WHERE `id_role` = :id_role');
      $requetes->bindParam(':id_role', $this->id_role);
      $requetes->execute();    

    } catch (PDOException $erreur){

      echo "Erreur de supression : " . $erreur->getMessage();
    }

  }
}