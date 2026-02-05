# ELK Self-Hosted Deployment (Ansible)

Ce dépôt contient une suite de playbooks Ansible permettant d'automatiser le déploiement de la stack ELK (Elasticsearch & Kibana) en mode auto-hébergé.

## Options de déploiement

### 1. All-In-One (AIO)
Déploiement complet sur une seule machine.
* **NoTLS** : Installation rapide pour tests ou environnement isolé.
* **TLS with Smallstep** : Installation sécurisée. Cette option nécessite une infrastructure **Smallstep PKI** fonctionnelle pour la gestion des certificats.
* **Kibana** : Enrôlement Automatique entre Kibana et Elasticsearch via script

### 2. Standalone (VM dédiées)
Playbooks séparés pour une infrastructure distribuée :
* **Elasticsearch** Ou **Kibana** :
    * *Étape 1* : Installation et configuration de base (sans TLS).
    * *Étape 2* : Sécurisation TLS via Smallstep.
* **Kibana** : Enrôlement manuel entre Kibana et Elasticsearch

## Focus sur la partie TLS
Le déploiement TLS est automatisé via **Smallstep** et une API Step-CA. 
* **Automatisation** : Des services **systemd** sont créés et activés sur les machines cibles pour assurer le **renouvellement automatique** des certificats sans intervention manuelle.
* **Sécurité** : Les communications entre Elasticsearch, Kibana et les clients sont intégralement chiffrées.

## Configuration requise
Avant de lancer un playbook, il est **impératif de vérifier les variables** dans les fichiers YAML pour s'assurer qu'elles correspondent à votre environnement (adresses IP, tokens Smallstep, configurations).
Le reste du processus est entièrement automatisé.



## Quick Start (Démarrage Rapide)

Pour une première prise en main ou un environnement de test, nous recommandons l'installation **All-In-One sans TLS**. Cela déploiera Elasticsearch et Kibana sur une même machine sans la complexité de la gestion des certificats.

>  **Dossier cible :** [All In One/NoTLS](https://github.com/AxelZoldik/elk-deployment/tree/main/All%20In%20One/NoTLS)

### 1. Cloner le dépôt
Récupérez l'ensemble du projet et placez-vous dans le répertoire du scénario NoTLS :

```bash
git clone git@github.com:AxelZoldik/elk-deployment.git
cd elk-deployment/All\ In\ One/NoTLS/
```
Configurez correctement les variables du playbook.yml
<img width="517" height="376" alt="image" src="https://github.com/user-attachments/assets/77e9bfa4-cf72-4041-bb9f-c23b55c74dd2" />
Configurez votre fichier hosts :
<img width="517" height="113" alt="image" src="https://github.com/user-attachments/assets/95ebc927-09e3-4c41-83f7-3ef8fde5d470" />

Une fois prêt, lancez le playbook à votre manière : 
```bash
ansible-playbook -i hosts playbook-eskb.yml --ask-become-pass
#Ou avec -k & -K si besoin de spécifier les mots de passes sudo
```
Résultat : 
<img width="470" height="221" alt="image" src="https://github.com/user-attachments/assets/d8d8f91c-9e13-4a16-8827-d1c923795c71" />
<img width="941" height="171" alt="image" src="https://github.com/user-attachments/assets/63b4a144-dfb1-4162-b2e1-f06ff06354b9" />

Vous pourrez alors accéder à l'interface graphique Kibana via votre URL/IP http://fqdnORip:5601
<img width="810" height="437" alt="image" src="https://github.com/user-attachments/assets/aeb20c7d-9067-41b5-bd7d-59e913a0ea8a" />
