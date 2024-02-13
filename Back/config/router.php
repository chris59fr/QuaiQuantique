<?php
    
// charger automatiquement les fichiers de définition des classes  => pour éviter les requires pour classes
    require_once __DIR__ . '/../../../Autoloader.php';
    App\Autoloader::register();

//génère automatiquement le chemin via la super_global $_SERVER de router.php et on enleve router.php de L URL
    define('ROOT', str_replace('router.php','',$_SERVER['SCRIPT_FILENAME']));
   

// On sépare les paramètres et on les met dans le tableau $params
    $params = explode('/', $_GET['p']);
    var_dump($params);
    die;
// Si au moins 1 paramètre existe
    if($params[0] != ""){
        // On sauvegarde le 1er paramètre dans $controller en mettant sa 1ère lettre en majuscule
        $controller = ucfirst($params[0]);

        // On sauvegarde le 2ème paramètre dans $action si il existe, sinon index
        $action = isset($params[1]) ? $params[1] : 'home';
// On appelle le contrôleur
        require_once(ROOT.'controllers/'.$controller.'.php');

// On instancie le contrôleur
        $controller = new $controller();

        if(method_exists($controller, $action)){
            // On supprime les 2 premiers paramètres
            unset($params[0]);
            unset($params[1]);

// On appelle la méthode $action du contrôleur $controller
            call_user_func_array([$controller,$action], $params);
        }else{
// On envoie le code réponse 404
            http_response_code(404);
            echo "La page recherchée n'existe pas";
        }
    }else{
    
    }