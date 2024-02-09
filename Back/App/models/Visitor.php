<?php
namespace App\Models;

class Visitor extends User
{

  public function __construct(public string $name, public string $email) {
    $this->name = $name;
    $this->email = $email;
  }

}