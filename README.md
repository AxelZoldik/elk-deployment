# ELK Self-Hosted Deployment (Ansible)

Ce dépôt contient une suite de playbooks Ansible permettant d'automatiser le déploiement de la stack ELK (Elasticsearch & Kibana) en mode auto-hébergé.

## 🚀 Options de déploiement

### 1. All-In-One (AIO)
Déploiement complet sur une seule machine.
* **NoTLS** : Installation rapide pour tests ou environnement isolé.
* **TLS with Smallstep** : Installation sécurisée. Cette option nécessite une infrastructure **Smallstep PKI** fonctionnelle pour la gestion des certificats.

### 2. Standalone (VM dédiées)
Playbooks séparés pour une infrastructure distribuée :
* **Elasticsearch** :
    * *Étape 1* : Installation et configuration de base (sans TLS).
    * *Étape 2* : Sécurisation TLS via Smallstep.
* **Kibana** : Installation et liaison à Elasticsearch.

## 🔒 Focus sur la partie TLS
Le déploiement TLS est automatisé via **Smallstep**. 
* **Automatisation** : Des services **systemd** sont créés et activés sur les machines cibles pour assurer le **renouvellement automatique** des certificats sans intervention manuelle.
* **Sécurité** : Les communications entre Elasticsearch, Kibana et les clients sont intégralement chiffrées.

## ⚠️ Configuration requise
Avant de lancer un playbook, il est **impératif de vérifier les variables** dans les fichiers YAML (ou `group_vars`) pour s'assurer qu'elles correspondent à votre environnement (adresses IP, tokens Smallstep, versions logicielles).
Le reste du processus est entièrement automatisé.
