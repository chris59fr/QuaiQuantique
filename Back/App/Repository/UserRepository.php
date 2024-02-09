<?php

namespace App\Repository;

use App\models\User;
use Exception;
use PDO;
use PDOException;


/**
 * Connection avec le methode insert etc 
 * liaison entre le model et comment il se stock
 * ici les user sont save et les vérifies leur données
 */

class UserRepository extends AbstractRepository 
{
  /**
   * Creation d'utilisateur
   */
  public function createUser(User $user) {
    
    try {
      //Vérification des types de donnée
      if (!is_string($user->getNameUser()) || 
          !is_string($user->getFristnameUser()) || 
          !is_string($user->getDobUser()) || 
          !is_string($user->getEmailUser()) || 
          !is_string($user->getPasswordUser()))
      {

        throw new Exception("Les types de donnes des champs ne sont pas valide");

      }

      //Verification du format @email
      if (!filter_var($user->getEmailUser(), FILTER_VALIDATE_EMAIL)) {

        throw new Exception("L'adresse mail n'est pas valide");

      }

      $requetes = $this->getDBConnection()->prepare('INSERT INTO `user`(`name_user`, `firstname_user`, `dob_user`, `email_user`, `password_user`) VALUES (:name_user, :firstname_user, :dob_user, :email_user, :password_user)'); 
      $requetes->bindValue(':name_user', $user->getNameUser());
      $requetes->bindValue(':firstname_user', $user->getFristnameUser());
      $requetes->bindValue(':dob_user', $user->getDobUser());
      $requetes->bindValue(':email_user', $user->getEmailUser());
      $requetes->bindValue(':password_user', $user->getPasswordUser());

      $requetes->execute();
      echo "l'utilisateur a bien été créé";

    } catch (PDOException $error){

      echo "Erreur lors de la création de l'utilisateur" . $error->getMessage();
    }
    
  }

  /**
   * Selection de tout les User
   * @return User[]
   */
  public function readUser(): array {

    try {
      //sélectionne tout les users
      $requetes = $this->getDBConnection()->prepare('SELECT * FROM `user`');
      $requetes->execute();
      $users = [];

      while ($userData = $requetes->fetch(PDO::FETCH_ASSOC)) {
        $users[] = new User($userData['id_user'], $userData['name_user'], $userData['firstname_user'], $userData['dob_user'], $userData['email_user'], $userData['']);
      }
      return $users;

    } catch (PDOException $error){

      echo  "Erreur lors de la récupération des users : " . $error->getMessage();
      return[];
    }
  }

  //voir JOINTURE selection utilisateur avec id_role de 1 = Admin  2 = employé  3 = clients
  

  /**
   * Update d'un utilisateur
   */
  public function updateUser(User $user){
    
    try {

      $requetes = $this->getDBConnection()->prepare('UPDATE `user` SET `name_user` = :name_user, `firstname_user` = :firstname_user, `dob_user` = :dob_user, `email_user` = :email_user');
      $requetes->bindValue(':name_user', $user->getNameUser());
      $requetes->bindValue(':firstname_user', $user->getFristnameUser());
      $requetes->bindValue(':dob_user', $user->getDobUser());
      $requetes->bindValue(':email_user', $user->getEmailUser());
      $requetes->execute();

      echo "l'utilisateur a bien été mise à jour";

    } catch (PDOException $error){

      echo "Erreur lors de la mise a jours de l'utilisateur" . $error->getMessage();
    }
  }

  /**
   * Update Password
   */
  public function updatePasswordUser(User $user) {

    try {

      $requetes = $this->getDBConnection()->prepare('UPDATE `user` SET `password_user` = :password_user WHERE `id_user` = :id_user');

      $newPasswordUser = password_hash($user->getPasswordUser(), PASSWORD_ARGON2ID);
      
      $requetes->bindValue(':password_user', $newPasswordUser);
      $requetes->bindValue(':id_user', $user->getIdUser());
      $requetes->execute();

      echo "Le mot de passe a bien été mise à jour";

    } catch (PDOException $error) {

      echo "Erreur lors de la mise a jours de l'utilisateur" . $error->getMessage();
    }
  }

  /**
   * Delete User
   */
  public function deleteUser(USER $id_user) {

    try {

      $requetes = $this->getDBConnection()->prepare('DELETE FROM `user` WHERE `id_user` = :id_user');
      $requetes->bindParam(':id_user', $id_user);
      $requetes->execute();

      echo "L\'utilisateur à été supprimer";

    }catch (PDOException $error) {

      echo "Erreur lors de la supression de l'utilisateur : " . $error->getMessage();
    }
  }
}