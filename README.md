# 🗃️ Base de Données – Gestion de Capsules, Magasins et Stocks

Projet SQL associé à une application web — Université du Havre.  
Cette base de données gère les informations relatives aux **capsules de café**, aux **magasins** partenaires, ainsi qu’à leur **stock** respectif.
Par la suite on travaillera avec Postgresql

---

## 👨‍💻 Auteur

**Baouche Mohamed Djaouad**  

---

## 🧱 Structure de la base

### 📦 Table `G11_capsule`
| Colonne         | Type         | Contraintes                              |
|-----------------|--------------|------------------------------------------|
| `cap_id`        | SERIAL       | PRIMARY KEY                              |
| `cap_nom`       | VARCHAR(50)  | UNIQUE, NOT NULL                         |
| `cap_prix`      | DECIMAL(4,2) | NOT NULL, CHECK (>= 0)                   |
| `cap_intensite` | INT          | NOT NULL, CHECK (>= 0)                   |

---

### 🏬 Table `G11_magasin`
| Colonne         | Type          | Contraintes                              |
|-----------------|---------------|------------------------------------------|
| `mag_id`        | SERIAL        | PRIMARY KEY                              |
| `mag_nom`       | VARCHAR(50)   | UNIQUE, NOT NULL                         |
| `mag_adresse`   | VARCHAR(100)  | UNIQUE, NOT NULL                         |
| `mag_quantite`  | INT           | CHECK (> 0)                              |

---

### 🔗 Table `G11_stocke`
| Colonne           | Type | Contraintes                          |
|-------------------|------|--------------------------------------|
| `cap_id`          | INT  | FOREIGN KEY → `G11_capsule.cap_id`  |
| `mag_id`          | INT  | FOREIGN KEY → `G11_magasin.mag_id`  |
| `stock_quantite`  | INT  | NOT NULL, CHECK (> 0)                |
| **Clé primaire**  | `(cap_id, mag_id)`                         |

---

## 🧠 Structure de données
- `tables.sql` : Création des tables + Insertion des données capsules, magasins et stocks
- `requetes.sql` : Requêtes de test SQL
- `README.md` : ce fichier
- `LICENSE` : licence du projet (MIT, par exemple)


