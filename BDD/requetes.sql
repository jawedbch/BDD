-- 1. Liste des magasins

SELECT mag_nom FROM G11_magasin;

-- 2. Liste des magasin dont l’adresse contient « tr » ou « ve » (choisir les chaînes modèles adaptées)

SELECT mag_nom FROM G11_magasin
WHERE ( mag_nom LIKE '%tr%' OR mag_nom LIKE '%ve%' );

-- 3. Liste des types de capsules entre 2 et 3 € (possibilité de changer l’intervalle)

SELECT DISTINCT cap_nom FROM G11_capsule where cap_prix BETWEEN 0.2 AND 0.5;

-- 4. Nombre de types de capsules

SELECT COUNT(DISTINCT cap_id) FROM G11_capsule where cap_prix BETWEEN 0.2 AND 0.5;

-- 5. Liste des magasin disposant de capsules entre 2 et 3 €

SELECT DISTINCT m.mag_nom
FROM G11_magasin m
JOIN G11_stocke s ON m.mag_id = s.mag_id
JOIN G11_capsule c ON s.cap_id = c.cap_id
WHERE c.cap_prix BETWEEN 0.4 AND 0.5;

-- 6. Stock du magasin "Festival Black Double Espresso"

SELECT m.mag_nom, s.stock_quantite
FROM G11_magasin m
JOIN G11_stocke s ON m.mag_id = s.mag_id
JOIN G11_capsule c ON s.cap_id = c.cap_id
WHERE c.cap_nom = 'Festive Black Double Espresso';

-- 7. Magasins où l’on trouve le type de capsule "Frosted Caramel Nuts"

SELECT DISTINCT m.mag_nom
FROM G11_magasin m
JOIN G11_stocke s ON m.mag_id = s.mag_id
JOIN G11_capsule c ON s.cap_id = c.cap_id
WHERE c.cap_nom = 'Frosted Caramel Nuts';

-- 8. Capsules disponibles dans au moins un magasin

SELECT DISTINCT c.cap_nom
FROM G11_capsule c
JOIN G11_stocke s ON c.cap_id = s.cap_id;

-- 9. Nombre total de capsules disponibles par magasin

SELECT m.mag_nom, COUNT(s.cap_id) AS nombre_capsules_disponibles
FROM G11_magasin m
LEFT JOIN G11_stocke s ON m.mag_id = s.mag_id
GROUP BY m.mag_id;

-- 10. Magasins disposant de plus de 10 types de capsules

SELECT m.mag_nom, COUNT(DISTINCT s.cap_id) AS nombre_types_capsules
FROM G11_magasin m
LEFT JOIN G11_stocke s ON m.mag_id = s.mag_id
GROUP BY m.mag_id
HAVING COUNT(DISTINCT s.cap_id) > 10;


