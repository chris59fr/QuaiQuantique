# QuaiQuantique
fichier vide `.gitkeep` qui sera suivi par Git ('penser a le supp quand dossier ce remplis');

Pour travailler : 
depuis la branch dev => creer une branch 'Nom' = git checkout -b Nom(exemple Justi);
depuis votre branch(Justi) => creer une branch feature/NomCarte => git checkout feature/NomCarte vous aller travailler sur cette branch là avec des git add ou commit etc, le soir vous aller push dans votre branch 'Nom';

# ATTENTION
Pour récupérer les updates de la branch dev faite => git pull dev SUR LA BRANCH DEV !!
Puis retourner sur votre branch Nom est faire => git merge dev
Ensuite faite => git add . (ajouter le nouvelle donnée) 
Puis faite => git commit -m 'upadate branch dev'
puis faite => git push Nom (votre branch)

# ATTENTION
SI et SEULEMENT SI vous pensez que votre code est correcte, vous envoyer un message à Justine ou Maxime, qui va valider votre travaille et SEULEMENT EUX devron merge sur la branch origin/dev et origine/main !!

# Js
Voila ou dois ce trouver le fichier JS (bundle) : FRONT -> asset -> scss -> bootstrap -> créer dossier JS est mettre dedans le