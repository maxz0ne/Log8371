# JGU WEKA Rest Service

Voici un résumé des commandes à exécuter pour consulter le monitoring et
"scaler" l'application WekaRest

## Démarage des services
Pour avoir le monitoring de Weka, il suffit de démarrer les services avec la commande suivante, à partir de la racine du projet:

```
$ docker-compose up
```

## Monitoring
Le monitoring est ajouté au fichier docker-compose. Une fois démarré, il est possible d'accéder au monitoring via l'adresse [http://localhost:9090](http://localhost:8080). Cette page est servie par le service Prometheus.

Pour consulter le pourcentage d'utilisation du CPU d'un seul conteneur, la commande suivante peut être insérée dans la ligne de requête de Prometheus. Remplacer <container_name> par le nom du container.

``rate(container_cpu_user_seconds_total{name=<container_name>}[10s])``

Cette requête lisse les données récupérées en faisant la moyenne des 10 dernières secondes. La spécification du nom du conteneur peut être omise.

Pour obtenir le nom des conteneurs docker, utilisez la commande suivante (les conteneus doivent être démarrés):

```
$ docker-compose ps
```

## Scaling
Afin de mettre à l'échelle l'application, il est possible de démarrer les services en ajoutant le flag scale:

```
$ docker-compose up --scale jguweka=<nombreDeRépliques>
```

Le fichier docker-compose inclut un load-balancer qui fera automatiquement la distribution des requêtes vers les différentes répliques de jguweka. 
