# JGU WEKA Rest Service

Voici un résumé des commandes à exécuter pour démarrer un conteneur Docker avec le service Rest de Weka.

## Prérequis
- Installation de Docker
- Installation de Maven
- Installation de Docker-Compose

## Installation des images
```
$ mvn clean package
$ docker pull mongo
$ docker build -t weka .
```

## Installation et démarrage de Weka Rest
```
$ docker-compose up
```

On peut maintenant accéder à l'interface Swagger de Weka Rest via cette [http://localhost:80](http://localhost:80)
