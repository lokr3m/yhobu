-- Extended yhobu database script
-- This script creates new tables, inserts data, and creates views

USE `yhobu`;

-- ============================================
-- 1. CREATE NEW TABLES
-- ============================================

-- Create personal table for trainers, stable hands and other personnel
CREATE TABLE IF NOT EXISTS personal (
  isikukood bigint unsigned NOT NULL,
  eesnimi varchar(64) NOT NULL,
  perekonnanimi varchar(64) NOT NULL,
  ametikoht enum('treener', 'tallimees', 'muu') NOT NULL,
  telefon varchar(16),
  tall_kood varchar(6) DEFAULT NULL COMMENT 'Tallimees töötab täpselt ühes tallis',
  inserted_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (isikukood),
  CONSTRAINT personal_ibfk_1 FOREIGN KEY (tall_kood) REFERENCES tall(kood),
  CONSTRAINT personal_chk_1 CHECK ((ametikoht = 'tallimees' AND tall_kood IS NOT NULL) OR (ametikoht != 'tallimees'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Personal - treenerid, tallimehed ja muu personal';

-- Create treeningprogramm table
CREATE TABLE IF NOT EXISTS treeningprogramm (
  nimi varchar(100) PRIMARY KEY,
  kirjeldus varchar(255) NOT NULL,
  vastutaja bigint unsigned NOT NULL,
  inserted_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (vastutaja) REFERENCES personal(isikukood)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Treeningprogrammid';

-- Create treening table
CREATE TABLE IF NOT EXISTS treening (
  id int unsigned NOT NULL AUTO_INCREMENT,
  hobune_registreerimiskood varchar(8) NOT NULL,
  treener_isikukood bigint unsigned NOT NULL,
  treeningu_aeg datetime NOT NULL,
  programm_nimi varchar(100) NOT NULL,
  kirjeldus varchar(255),
  inserted_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT treening_ibfk_1 FOREIGN KEY (hobune_registreerimiskood) REFERENCES hobune(registreerimiskood),
  CONSTRAINT treening_ibfk_2 FOREIGN KEY (treener_isikukood) REFERENCES personal(isikukood),
  CONSTRAINT treening_ibfk_3 FOREIGN KEY (programm_nimi) REFERENCES treeningprogramm(nimi)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Treeningud';

-- ============================================
-- 2. INSERT DATA INTO PERSONAL TABLE (at least 10 rows)
-- ============================================

INSERT INTO personal (isikukood, eesnimi, perekonnanimi, ametikoht, telefon, tall_kood) VALUES
(38501234567, 'Marta', 'Kask', 'treener', '5551234', NULL),
(39012345678, 'Jaanus', 'Tamm', 'treener', '5552345', NULL),
(37503456789, 'Kristiina', 'Põld', 'treener', '5553456', NULL),
(38604567890, 'Andres', 'Mägi', 'treener', '5554567', NULL),
(36705678901, 'Mari', 'Pärn', 'tallimees', '5555678', '2'),
(39806789012, 'Toomas', 'Kukk', 'tallimees', '5556789', '5'),
(37907890123, 'Kristi', 'Saar', 'tallimees', '5557890', '5A'),
(38008901234, 'Peeter', 'Lepp', 'tallimees', '5558901', '7'),
(39109012345, 'Anne', 'Kivi', 'tallimees', '5559012', '7A'),
(37210123456, 'Margus', 'Raud', 'tallimees', '5550123', '7B'),
(38311234567, 'Liina', 'Org', 'muu', '5551235', NULL),
(39412345678, 'Jüri', 'Veski', 'muu', '5552346', NULL);

-- ============================================
-- 3. INSERT DATA INTO TREENINGPROGRAMM TABLE (3 rows)
-- ============================================

INSERT INTO treeningprogramm (nimi, kirjeldus, vastutaja) VALUES
('Algajate programm', 'Põhilised oskused ja treeningud algajatele hobustele', 38501234567),
('Võistluste ettevalmistus', 'Intensiivne programm võistlusteks valmistumiseks', 39012345678),
('Taastusravi programm', 'Programm vigastustest taastumiseks ja rehabilitatsiooniks', 37503456789);

-- ============================================
-- 4. INSERT DATA INTO TREENING TABLE (at least 10 rows)
-- ============================================

INSERT INTO treening (hobune_registreerimiskood, treener_isikukood, treeningu_aeg, programm_nimi, kirjeldus) VALUES
('200', 38501234567, '2025-10-01 09:00:00', 'Algajate programm', 'Põhioskuste treening'),
('201', 38501234567, '2025-10-01 10:30:00', 'Algajate programm', 'Takistuste ületamine'),
('202', 39012345678, '2025-10-02 09:00:00', 'Võistluste ettevalmistus', 'Kiirustreening'),
('203', 39012345678, '2025-10-02 11:00:00', 'Võistluste ettevalmistus', 'Vastupidavustreening'),
('204', 37503456789, '2025-10-03 09:00:00', 'Taastusravi programm', 'Kerge jalutuskäik'),
('205', 38501234567, '2025-10-03 14:00:00', 'Algajate programm', 'Sööda annustamise järgi treening'),
('206', 39012345678, '2025-10-04 09:00:00', 'Võistluste ettevalmistus', 'Hüpete treening'),
('207', 37503456789, '2025-10-04 10:00:00', 'Taastusravi programm', 'Massaaž ja venitusharjutused'),
('208', 38501234567, '2025-10-05 09:00:00', 'Algajate programm', 'Galopi treening'),
('209', 39012345678, '2025-10-05 11:00:00', 'Võistluste ettevalmistus', 'Tehnikatreening'),
('210', 38501234567, '2025-10-06 09:00:00', 'Algajate programm', 'Ratsaniku käsud'),
('211', 39012345678, '2025-10-06 14:00:00', 'Võistluste ettevalmistus', 'Simuleeritud võistlus'),
('200', 39012345678, '2025-10-07 09:00:00', 'Võistluste ettevalmistus', 'Lisatreening'),
('201', 37503456789, '2025-10-07 10:00:00', 'Taastusravi programm', 'Taastumine pärast vigastust'),
('202', 38501234567, '2025-10-08 09:00:00', 'Algajate programm', 'Kordustreening');

-- ============================================
-- 5. INSERT MORE DATA INTO EXISTING TABLES
-- ============================================

-- Add more doctors (arst) - at least 10 total
INSERT INTO arst (isikukood, eesnimi) VALUES
(12312312315, 'Laura'),
(12312312316, 'Martin'),
(12312312317, 'Karin'),
(12312312318, 'Rainer'),
(12312312319, 'Sirje'),
(12312312320, 'Taavi'),
(12312312321, 'Kadri');

-- Add more visits (visiit) - at least 10 total with different doctors
INSERT INTO visiit (hobune_registreerimiskood, arst_isikukood, visiidi_aeg, visiidi_kirjeldus, hind) VALUES
('201', 12312312313, '2025-10-15 10:00:00', 'Rutiin kontroll', 85.00),
('202', 12312312314, '2025-10-16 11:00:00', 'Hammaste kontroll', 95.00),
('203', 12312312315, '2025-10-17 09:30:00', 'Vaktsinatsioon', 120.00),
('204', 12312312316, '2025-10-18 14:00:00', 'Vigastuse ravi', 150.00),
('205', 12312312317, '2025-10-19 10:30:00', 'Kontroll peale ravi', 75.00),
('206', 12312312318, '2025-10-20 15:00:00', 'Üldine tervisekontroll', 100.00),
('207', 12312312319, '2025-10-21 09:00:00', 'Labori analüüsid', 135.00),
('208', 12312312320, '2025-10-22 11:30:00', 'Kopse kontroll', 110.00),
('209', 12312312321, '2025-10-23 13:00:00', 'Jalgade kontroll', 90.00),
('210', 12312312312, '2025-10-24 10:00:00', 'Hammasoperatsioon', 200.00),
('211', 12312312313, '2025-10-25 14:30:00', 'Kohustuslik kontroll', 80.00);

-- Add more inventory (inventar) - at least 10 total with different owners
INSERT INTO inventar (kirjeldus, hind, tall_kood, omanik_isikukood) VALUES
('Tallihari', 45.50, NULL, 100000),
('Ratsasaabas', 120.00, NULL, 100001),
('Kiiver', 89.99, NULL, 100002),
('Püksid', 65.00, NULL, 100003),
('Suitsud', 25.00, NULL, 100004),
('Hobusevaip', 95.00, NULL, 100005),
('Toitesegu', 55.50, NULL, 100006),
('Karjatõke', 450.00, '2', NULL),
('Puhastusharjad komplekt', 35.00, NULL, 100008),
('Ratsamadrats', 850.00, NULL, 100000),
('Kannused', 42.00, NULL, 100001);

-- ============================================
-- 6. UPDATE ÜLLAR LINDMAA NAME
-- ============================================

UPDATE omanik SET eesnimi = 'Mihkel', perekonnanimi = 'Kuusk' 
WHERE isikukood = 36576574545;

-- ============================================
-- 7. ADD A CLASSMATE WITHOUT HORSES
-- ============================================

INSERT INTO omanik (isikukood, eesnimi, perekonnanimi, aadress, telefon) VALUES
(39505123456, 'Karin', 'Tamm', 'Tartu', '5559999');

-- ============================================
-- 8. CREATE VIEWS
-- ============================================

-- View: nimed - owners and their horses (including owners without horses)
CREATE OR REPLACE VIEW nimed AS 
SELECT o.eesnimi, o.perekonnanimi, h.nimi 
FROM omanik o
LEFT JOIN hobune h ON o.isikukood = h.omanik_isikukood;

-- View: tallimehed - all stable hands (tallimehed) excluding trainers
CREATE OR REPLACE VIEW tallimehed AS
SELECT isikukood, eesnimi, perekonnanimi, telefon, tall_kood
FROM personal
WHERE ametikoht = 'tallimees';

-- View: omanik_inventari_kulud - total inventory costs per owner
CREATE OR REPLACE VIEW omanik_inventari_kulud AS
SELECT o.eesnimi, o.perekonnanimi, COALESCE(SUM(i.hind), 0) AS kogumaksumUs
FROM omanik o
LEFT JOIN inventar i ON o.isikukood = i.omanik_isikukood
GROUP BY o.isikukood, o.eesnimi, o.perekonnanimi;

-- View: omanik_arsti_maksed - owner vet payments with details
CREATE OR REPLACE VIEW omanik_arsti_maksed AS
SELECT o.eesnimi AS omanik_eesnimi, o.perekonnanimi AS omanik_perekonnanimi, 
       h.nimi AS hobuse_nimi, v.arst_isikukood, v.hind AS visiidi_tasu
FROM omanik o
JOIN hobune h ON o.isikukood = h.omanik_isikukood
JOIN visiit v ON h.registreerimiskood = v.hobune_registreerimiskood;

-- View: hobuse_treeningud - count of training sessions per horse
CREATE OR REPLACE VIEW hobuse_treeningud AS
SELECT h.nimi AS hobuse_nimi, COUNT(t.id) AS treeningute_arv
FROM hobune h
LEFT JOIN treening t ON h.registreerimiskood = t.hobune_registreerimiskood
GROUP BY h.registreerimiskood, h.nimi;

-- View: custom query - trainers and their training programs
CREATE OR REPLACE VIEW treenerite_programmid AS
SELECT p.eesnimi, p.perekonnanimi, tp.nimi AS programmi_nimi, tp.kirjeldus
FROM personal p
JOIN treeningprogramm tp ON p.isikukood = tp.vastutaja
WHERE p.ametikoht = 'treener';
