<?php

namespace App\Repository;

use App\config\Database;

/**
 * Parents des Repos
 */

abstract class AbstractRepository 
{
    /**
   * Connexion BDD
   */
  protected function getDBConnection() 
  {
    $db = Database::getInstance();
    return $db->getConnexion();
  }

}