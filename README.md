Créer un fichier vide .gitkeep qui sera suivi par Git (penser à le supprimer quand le dossier se remplit).

Pour travailler :

Depuis la branche dev, créer une branche à votre nom, par exemple git checkout -b Justi.
Depuis votre branche (Justi), créer une branche pour la fonctionnalité sur laquelle vous travaillez, par exemple git checkout -b feature/NomCarte. Vous allez travailler sur cette branche-là avec des git add, git commit, etc. Le soir, vous allez pousser vos changements dans votre branche nominative (Justi).
ATTENTION
Pour récupérer les mises à jour de la branche dev, faites => git pull origin dev SUR LA BRANCHE dev !!
Ensuite, retournez sur votre branche nominative et faites => git merge dev
Après cela, faites => git add . (pour ajouter les nouvelles données)
Puis, faites => git commit -m 'update branch dev'
Et enfin, faites => git push origin <VotreBranche> (remplacez <VotreBranche> par le nom de votre branche)

ATTENTION
SI et SEULEMENT SI vous pensez que votre code est correct, envoyez un message à Justine ou Maxime, qui va valider votre travail. Et SEULEMENT EUX devront merger sur les branches origin/dev et origin/main !!

JavaScript
Voici où doit se trouver le fichier JavaScript (bundle) : FRONT -> assets -> scss -> bootstrap. Créez un dossier JS et mettez-y le fichier.
