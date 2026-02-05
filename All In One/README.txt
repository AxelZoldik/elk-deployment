### 1. All-In-One (AIO)
Déploiement complet sur une seule machine.

* **NoTLS** : Ce Playbook sert à installer Elasticsearch et Kibana sur une même machine sans certificats et donc sans chiffrement.
* **TLS With Smallstep** : Ce Playbook sert à installer Elasticsearch et Kibana sur une même machine avec des certificats via le serveur PKI de Step-CA. Le playbook appelle des fichiers spécifiques situés dans le sous-dossier `files/`.
