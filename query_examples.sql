-- YHOBU DATABASE - QUERY EXAMPLES
-- Quick reference for testing all views and requirements

USE yhobu;

-- ============================================
-- 1. VIEW: nimed
-- Shows all owners with their horses (LEFT JOIN includes owners without horses)
-- ============================================
SELECT * FROM nimed 
ORDER BY perekonnanimi, eesnimi 
LIMIT 10;

-- Find owners without horses
SELECT * FROM nimed 
WHERE nimi IS NULL;

-- ============================================
-- 2. VIEW: tallimehed
-- Shows all stable hands (tallimehed) excluding trainers
-- ============================================
SELECT * FROM tallimehed
ORDER BY perekonnanimi;

-- Join with tall to see stable addresses
SELECT t.eesnimi, t.perekonnanimi, t.telefon, ta.aadress AS talli_aadress
FROM tallimehed t
JOIN tall ta ON t.tall_kood = ta.kood;

-- ============================================
-- 3. VIEW: omanik_inventari_kulud
-- Shows total inventory costs per owner
-- ============================================
SELECT * FROM omanik_inventari_kulud
ORDER BY kogumaksumUs DESC;

-- Find owners who spent more than 100 EUR
SELECT * FROM omanik_inventari_kulud
WHERE kogumaksumUs > 100
ORDER BY kogumaksumUs DESC;

-- ============================================
-- 4. VIEW: omanik_arsti_maksed
-- Links owners with vet payments (owner name, horse name, doctor ID, visit cost)
-- ============================================
SELECT * FROM omanik_arsti_maksed
ORDER BY omanik_perekonnanimi, hobuse_nimi
LIMIT 10;

-- Total vet costs per owner
SELECT omanik_eesnimi, omanik_perekonnanimi, SUM(visiidi_tasu) AS kokku_arsti_kulud
FROM omanik_arsti_maksed
GROUP BY omanik_eesnimi, omanik_perekonnanimi
ORDER BY kokku_arsti_kulud DESC;

-- ============================================
-- 5. VIEW: hobuse_treeningud
-- Shows training count per horse
-- ============================================
SELECT * FROM hobuse_treeningud
ORDER BY treeningute_arv DESC, hobuse_nimi
LIMIT 15;

-- Find horses that have been trained
SELECT * FROM hobuse_treeningud
WHERE treeningute_arv > 0
ORDER BY treeningute_arv DESC;

-- Find horses without any training
SELECT * FROM hobuse_treeningud
WHERE treeningute_arv = 0
LIMIT 10;

-- ============================================
-- 6. VIEW: treenerite_programmid
-- Custom query: Shows trainers and their training programs
-- ============================================
SELECT * FROM treenerite_programmid
ORDER BY perekonnanimi;

-- ============================================
-- ADDITIONAL USEFUL QUERIES
-- ============================================

-- Show all tables
SHOW TABLES;

-- Show all views
SELECT table_name FROM information_schema.views 
WHERE table_schema = 'yhobu' 
ORDER BY table_name;

-- Count rows in each table
SELECT 'arst' AS tabel, COUNT(*) AS ridu FROM arst
UNION ALL SELECT 'hobune', COUNT(*) FROM hobune
UNION ALL SELECT 'inventar', COUNT(*) FROM inventar
UNION ALL SELECT 'omanik', COUNT(*) FROM omanik
UNION ALL SELECT 'personal', COUNT(*) FROM personal
UNION ALL SELECT 'tall', COUNT(*) FROM tall
UNION ALL SELECT 'treening', COUNT(*) FROM treening
UNION ALL SELECT 'treeningprogramm', COUNT(*) FROM treeningprogramm
UNION ALL SELECT 'visiit', COUNT(*) FROM visiit
ORDER BY tabel;

-- Show table structure
DESCRIBE personal;
DESCRIBE treeningprogramm;
DESCRIBE treening;

-- Verify foreign key relationships
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    TABLE_SCHEMA = 'yhobu'
    AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, COLUMN_NAME;

-- ============================================
-- VERIFICATION QUERIES FOR REQUIREMENTS
-- ============================================

-- Verify Üllar Lindmaa was changed to Mihkel Kuusk
SELECT eesnimi, perekonnanimi 
FROM omanik 
WHERE isikukood = 36576574545;

-- Verify classmate without horses (Karin Tamm)
SELECT o.eesnimi, o.perekonnanimi, COUNT(h.registreerimiskood) AS hobuste_arv
FROM omanik o
LEFT JOIN hobune h ON o.isikukood = h.omanik_isikukood
WHERE o.isikukood = 39505123456
GROUP BY o.isikukood, o.eesnimi, o.perekonnanimi;

-- Verify different owners in inventar
SELECT DISTINCT omanik_isikukood 
FROM inventar 
WHERE omanik_isikukood IS NOT NULL 
ORDER BY omanik_isikukood;

-- Verify different doctors in visiit
SELECT DISTINCT v.arst_isikukood, a.eesnimi
FROM visiit v
JOIN arst a ON v.arst_isikukood = a.isikukood
ORDER BY v.arst_isikukood;

-- Verify tallimehed are linked to stables
SELECT p.eesnimi, p.perekonnanimi, p.ametikoht, p.tall_kood, t.aadress
FROM personal p
JOIN tall t ON p.tall_kood = t.kood
WHERE p.ametikoht = 'tallimees'
ORDER BY p.perekonnanimi;

-- Show all trainers (excluding tallimehed)
SELECT eesnimi, perekonnanimi, ametikoht, telefon
FROM personal
WHERE ametikoht = 'treener'
ORDER BY perekonnanimi;

-- Show training programs with responsible trainers
SELECT tp.nimi, tp.kirjeldus, p.eesnimi, p.perekonnanimi
FROM treeningprogramm tp
JOIN personal p ON tp.vastutaja = p.isikukood
ORDER BY tp.nimi;

-- Show training sessions with details
SELECT 
    t.id,
    h.nimi AS hobune,
    p.eesnimi AS treener_eesnimi,
    p.perekonnanimi AS treener_perekonnanimi,
    t.treeningu_aeg,
    t.programm_nimi,
    t.kirjeldus
FROM treening t
JOIN hobune h ON t.hobune_registreerimiskood = h.registreerimiskood
JOIN personal p ON t.treener_isikukood = p.isikukood
ORDER BY t.treeningu_aeg DESC
LIMIT 10;
