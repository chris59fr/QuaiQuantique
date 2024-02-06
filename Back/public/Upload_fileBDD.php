<?php

require_once '../config/PDO.php';

if (isset($_POST['submit'])){

  $file = $_FILES['file'];
  $fileName = $_FILES['file']['name'];
  $fileSize = $_FILES['file']['size'];
  $fileTmp = $_FILES['file']['tmp_name'];

  //chemin des fichier 
  $cheminlocal = realpath($fileTmp);
  //Type mime du fichier
  $mimeTypeFile = mime_content_type($_FILES['file']['tmp_name']);
  $typeMime = array('image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/webp');
  $allowebExt = array('.jpg', '.jpeg', '.png', '.gif', '.webp');
  $fileExt = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
  $sizeMax = 10000000;
  
  if (in_array($mimeTypeFile, $typeMime)) {

    if (!in_array($fileExt, $allowebExt)) {

      if ($fileSize < $sizeMax){

        //Obtenir Info chemin fichier
        $fileNewName = pathinfo($fileName);
        //obtenir le nom sans extention
        $fileNameNoExt = $fileNewName['filename'];
        //obtenir le type fichier
        $fileNameExt = $fileNewName['extension'];
        //Objetenir la date du jour
        $date = date('Ymd-His');

        //chemin des fichier bdd
        $filePath = 'uploads/' . $fileNameNoExt . '_' . $date . '.' . $fileNameExt;
        move_uploaded_file($cheminlocal, $filePath);

        try {
          $requete = $bdd->prepare("INSERT INTO `images`(`name_images`, `chemin_images`) VALUES (:fileNameNoExt, :filePath)");
          $requete->bindParam(":fileNameNoExt", $fileNameNoExt);
          $requete->bindParam(":filePath", $filePath);
          $requete->execute();

          header("Location: Upload_fileBDD.PHP?uploadsucess");
          echo "L'image a été télécharger avec succes";

        } catch (PDOException $e) {

          echo 'Erreur lors de l\'insertion du fichier dans la base de donnée : '. $e->getMessage(); 
          
        }

      } else {

        echo "Votre fivhier doit faire moin de 10Mo";
      }

    } else {

      echo "Erreur : seuls les fichiers JPG, JPEG, PNG, GIF, WEBP sont autorisés.";

    }
  } else {

    echo 'Ce fichier n\'est pas une image';
  }

}


?>

<!DOCTYPE html>
<html lang="FR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>upload_file</title>
</head>

  <body>

    <form action="" method="post" enctype="multipart/form-data">
      <input type="file" name="file">
      <button type="submit" name="submit">UPLOAD</button>
    </form>

  </body>

</html>