# TP 5 - CI/CD

Ce TP a été réalisé dans le cadre de la formation "Ingénieur devops" d'AJC ingénieurie. Le sujet a été réalisé par Vanessa David, Ingénieure DevOps.

Les fichiers Dockerfile se stuant à la racine (pour le build.gradle) et dans le dossier jenkins (pour le Jenkinsfile) ont servis a installer le nécessaire pour faire fonctionner les fichiers build.gradle et le Jenkinsfile. L'utilisation de ces fichiers sera détaillé ci-dessous.
## Pré-requis

Avoir installer les outils ci-dessous:
 - Docker
 - Minikube
 - Kubectl

Dans un second temps il vous faudra récupérer le dossiet git qui se trove à l'adresse suivante : 
https://github.com/NicolasWattiez/tp_ci_cd

Pour le cloner sur votre machine, ouvrez un terminal et effectuez la commande suivante : 
```
git clone git@github.com:NicolasWattiez/tp_ci_cd.git
```
## Démarrer minikube

```
minikube start
```

Vérifier le statut de minikube

```
minikube status
```
Cette commande doit vous afficher le message suivant si minikube est bien démarré

```
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```
## Utilisation du fichier build.gradle

1) Se placer dans le dossier cloner 

```
cd tp_ci_cd
```
2) Builder votre image grâce au Dockerfile présent dans la racine

```
docker build -t gradle_tp5 .
```
*où gradle_tp5 est le nom que vous souhaitez donner à votre image, . signifie que vous utilisez votre répertoire courrant pour aller  chercher le Dockerfile*

NB: Le Dockerfile utilisé ici contient les installations nécessaires à l'exécution du build.gradle. 
Il finit par lancer les tâches contenues dans build.gradle. Au final, vous aurez construit une archive zip contenant l’intégralité des fichiers nécessaires au focntionnement de l’application. 

Le build.gradle permet aussi si nécessaire de nettoyer des dossiers / fichiers inutiles et d’installer les dépendances de l’application.

3) Accès au conteneur grâce à l'image buildée

Si besoin, vous pouvez accéder au conteneur depuis votre terminal : 
```
docker run -it <id_conteneur> bash
```
*où <id_conteneur> doit être remplacée par le numéro du conteneur qui vous ait fournis à la fin du build (de l'étape 2). Il s'agit d'une suite de chiffres et de lettres.*

## Utilisation du Jenkinsfile

1) Lancer jenkins grâce au docker-compose

```
docker-compose up -d
```
2) Il est nécessaire de configurer jenkins, pour celà :
- rendez-vous à l'adresse suivante :
  http//localhost:8098
- Sign-in
- Récupérer le mot de passe initial de l'admin (dans le terminal) à l'aide du chemin fourni (sur l'interface internet jenkins). Pour celà :
  Connectez vous au conteneur via le terminal
```
docker exec -it jenkins bash
```
Vous êtes dans le conteneur, afficher le mot de passe grâce au chemin fournis puis copier le dans la page internet jenkins :
```
root@939ba8b81655:/# cat /var/jenkins_home/secrets/initialAdminPassword 
ff7cc9944688470c9fc684ce7b9899b9
```
Passer à l'étape suivante.
- Configurer les plugins (vous pouvez laisser les plugins recommandés), attendre la fin du téléchargement 
- Configurer votre compte admin (créer un mot de passe, le confirmer, ajouter un nom et une adresse mail)
- Valider l'url jenkins
- Sauvegarder et finir
- Vous êtes prêt à utiliser votre jenkins :)

3) Installer le plug-in Gradle
Sur la page internet de jenkins effectuer les étapes suivantes :
- Dans Administrer Jenkins 
- Configuration globale des outils on configure l'installation de gradle 
- Descendre jusqu'à la partie Gradle 
- Cliquer sur Add Gradle
- Donner lui un nom (ex: gradle)
- Sauvegarder


4) Créer un projet pipeline
- Retourner au Dashboard
- Créer un job pipeline et lui donner un nom et valider 
- Cliquer sur l'ongler pipeline 
- Choisir "Pipeline script from SCM" pour la définition 
- Choisir 'Git' pour SCM et lui donner l'adresse du dépôt (https://github.com/NicolasWattiez/tp_ci_cd)
- Dans 'Branches to build' écrire 
```
*/main
```
- Sauvegarder

5) Lancer le build avec Build Now





