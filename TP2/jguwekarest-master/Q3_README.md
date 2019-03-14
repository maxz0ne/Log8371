# JGU WEKA Rest Service

Voici un résumé des commandes à exécuter pour démarrer profiler l'application JGU Weka.

## Prérequis
- JGU weka est deployé. (Voir Q2_README.md pour davantage d'informations)
- Installation de JProfiler

## Récupération de l'adresse IP du conteneur de JGU Weka
```
$ docker inspect weka | grep -P "IPAddress" | grep -P "\d+"
```

## Démarage du profilage du conteneur JGU Weka
```
$ docker exec -it weka bash
$ chmod +x /home/tomcat/start_profiling.exp
$ /home/tomcat/start_profiling.exp
```

### JProfiler
- Ouvrir l'application jprofiler
- Appuyer sur Ctrl + n pour demarer une nouvelle session
- Appuyer sur "Attach to remote VM"
- Entrer l'adresse IP recuperer ci-haut
- Entrer le port 8849
- Appuyer sur le boutton "ok" et appuyer sur les prochains bouttons "next" sans modifier aucun parametre.

