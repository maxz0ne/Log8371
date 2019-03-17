# JGU WEKA Rest Service

Voici un résumé des commandes à exécuter pour exécuter les tests de charge sur Weka REST.

## Prérequis
- JGU weka est deployé. (Voir Q2_README.md pour davantage d'informations)
- JMeter est installé

## Démarage de JMeter
```
- Parcourir le dossier de l'application JMeter jusqu'à l'intérieur du dossier /bin.
- Exécuter le script "jmeter" et l'application s'ouvrira
```

### JMeter
- Ouvrir le plan de tests via File->Open
- Cliquer sur l'onglet "Test Users"
  - Il est alors possible d'ajuster le nombre de users (Number of threads), la période de création (Ramp-Up Period) et le nombre d'itérations (loop count).
- Sous "Recording Controller", il est possible de voir les 5 requêtes/tests exécutés par itération par user.
- Toujours sous "Test Users", il est possible de voir le résultats des tests dans "View Results Tree"
- Pour lancer les tests, Run->Start

