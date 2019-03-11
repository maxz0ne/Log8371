# JGU WEKA Rest Service

Voici un résumé des commandes à exécuter pour démarrer un conteneur Docker avec le service Rest de Weka.

## Prérequis
- Installation de Docker
- Installation de Maven

## Installation et démarrage d'un conteneur Mongo
```
$ docker pull mongo
$ docker run --name mongodb -d mongo
```

## Installation et démarrage de Weka Rest
```
$ mvn clean package
$ docker build -t dockerhubuser/jguweka:0AS3 .
$ docker run -p 8080:8080 --link mongodb:mongodb dockerhubuser/jguweka:0AS3
```

On peut maintenant accéder à l'interface Swagger de Weka Rest via cette [adresse](http://localhost:8080)
