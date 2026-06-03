## ADR n°2 : Choix de PostgreSQL 16 (Supabase) comme Base de Données Principale

### 1. Statut
**Accepté**

### 2. Contexte
L'application **Smart-Collect** doit stocker de manière sécurisée et structurée les profils utilisateurs, l'historique des collectes, et les données des terminaux IoT. Nous avons besoin d'une intégrité absolue des données et d'une gestion solide des relations.

### 3. Décision
Nous adoptons **PostgreSQL 16** hébergé de manière managée sur **Supabase**. Cette base sera strictement **interne** et accessible uniquement par notre Backend Node.js.

### 4. Justification
* **Modèle relationnel** : Les entités du projet (utilisateurs, terminaux, collectes) possèdent de fortes relations interconnectées. Un modèle SQL est donc requis.
* **Supabase (Service Managé)** : Supabase nous évite d'installer et de configurer Linux, le réseau ou les sauvegardes de la base de données manuellement. Tout est automatisé.
* **Sécurité par l'isolement** : Aucun accès direct du public n'est autorisé. Le Backend Node.js sert de filtre de sécurité unique.

### 5. Conséquences
* **Positives** : Sécurité maximale, intégrité forte des données, intégration parfaite avec l'ORM Prisma de l'équipe Backend (E1).
* **Négatives** : Dépendance aux limites de stockage du forfait gratuit de Supabase.
