<?php

namespace App\Models;

class User 
{
  public function __construct(private ?int $id_user, private string $name_user, private string $firstname_user, private string $dob_user, private string $email_user, private string $password_user)
  {
    $this->id_user = $id_user;
    $this->name_user = $name_user;
    $this->firstname_user = $firstname_user;
    $this->dob_user = $dob_user;
    $this->email_user = $email_user;
    //statut
    $this->password_user = password_hash($password_user, PASSWORD_BCRYPT);
  }

    /**
     * Getter et Setter id_user
     */
    public function getIdUser(): ?int
    {
        return $this->id_user;
    }

    public function setIdUser(int $id_user): self
    {
        $this->id_user = $id_user;

        return $this;
    }
    

    /**
     * Getter et Setter name_user
     */
    public function getNameUser(): string
    {
      return $this->name_user;
    }

    public function setNameUser(string $name_user): void
    {
      $this->name_user = $name_user;
    }


    /**
     * Getter et Setter firstname_user
     */
    public function getFristnameUser(): string
    {
      return $this->firstname_user;
    }

    public function setFirstnameUser(string $firstname_user): void
    {
      $this->firstname_user = $firstname_user;
    }


    /**
     * Getter et Setter 
     */
    public function getDobUser(): string
    {
      return $this->dob_user;
    }
    
    public function setDobUser(string $dob_user): void
    {
      $this->dob_user = $dob_user;
    }


    /**
     * Getter et Setter email_user
     */
    public function getEmailUser(): string
    {
      return $this->email_user;
    }

    public function setEmailUser(string $email_user): void
    {
      $this->email_user = $email_user;
    }
    

    /**
     * Getter et Setter password_
     */
    public function getPasswordUser(): string
    {
      return $this->password_user;
    }

    public function setPasswordUser(string $password_user): void
    {
      $this->password_user = password_hash($password_user, PASSWORD_BCRYPT);
    }

    public function verifyPassword(string $password) : bool
    {
      return password_verify($password, $this->password_user);
    }
}