# Yhobu Database - Solution Documentation

## Overview
This repository contains the complete solution for the yhobu database assignment.

## Files

### 1. `Dump20251027.sql`
Original database dump provided for the assignment.

### 2. `yhobu_extended.sql`
Extension script that should be run after importing the original dump. This script contains:
- Creation of 3 new tables (personal, treeningprogramm, treening)
- Data insertions for all tables
- Data updates (Üllar Lindmaa name change)
- Creation of 6 views

### 3. `yhobu_final.sql`
Complete database export including all tables, data, and views. This is ready for submission.

## Database Structure

### Tables (9 total)
1. **arst** - Veterinarians (10 rows)
2. **hobune** - Horses (34 rows)
3. **inventar** - Inventory (12 rows)
4. **omanik** - Owners (10 rows)
5. **tall** - Stables (6 rows)
6. **visiit** - Vet visits (12 rows)
7. **personal** - Personnel (trainers, stable hands, other) (12 rows) - NEW
8. **treeningprogramm** - Training programs (3 rows) - NEW
9. **treening** - Training sessions (15 rows) - NEW

### Views (6 total)
1. **nimed** - Owners and their horses (LEFT JOIN includes owners without horses)
2. **tallimehed** - All stable hands (excluding trainers)
3. **omanik_inventari_kulud** - Total inventory costs per owner
4. **omanik_arsti_maksed** - Owner vet payment details (owner name, horse name, doctor ID, visit cost)
5. **hobuse_treeningud** - Training session count per horse
6. **treenerite_programmid** - Trainers and their training programs (custom query)

## Requirements Fulfilled

✅ Created 3 new tables with proper relationships
✅ personal table includes personnel with different roles
✅ Stable hands (tallimees) are properly linked to specific stables
✅ Inserted 10+ rows into all existing tables (except treeningprogramm with 3 rows)
✅ Inventar table has different owners
✅ Visiit table has different doctors
✅ Updated "Üllar Lindmaa" to "Mihkel Kuusk" using UPDATE
✅ Added classmate "Karin Tamm" without any horses
✅ Created all required views
✅ Created custom query view (treenerite_programmid)

## How to Use

### Option 1: Import complete database
```sql
mysql -u username -p < yhobu_final.sql
```

### Option 2: Import original + extension
```sql
mysql -u username -p < Dump20251027.sql
mysql -u username -p yhobu < yhobu_extended.sql
```

## Key Features

### Foreign Key Relationships
- personal.tall_kood → tall.kood (for stable hands)
- treeningprogramm.vastutaja → personal.isikukood
- treening.hobune_registreerimiskood → hobune.registreerimiskood
- treening.treener_isikukood → personal.isikukood
- treening.programm_nimi → treeningprogramm.nimi

### Constraints
- Stable hands must be linked to exactly one stable (CHECK constraint)
- Inventory must belong to either a stable OR an owner (CHECK constraint)
- All timestamp fields (inserted_at, updated_at) are managed automatically by MySQL

## Testing Queries

You can test the views with:
```sql
-- View all owners with/without horses
SELECT * FROM nimed;

-- View all stable hands
SELECT * FROM tallimehed;

-- View inventory costs per owner
SELECT * FROM omanik_inventari_kulud;

-- View vet payment details
SELECT * FROM omanik_arsti_maksed;

-- View training counts per horse
SELECT * FROM hobuse_treeningud;

-- View trainers and their programs
SELECT * FROM treenerite_programmid;
```

## Notes
- Database name remains "yhobu" as required
- Auto-increment fields (id) are not manually populated
- Audit fields (inserted_at, updated_at) are managed by MySQL automatically
- Different owners in inventar table: 9 different owners
- Different doctors in visiit table: 10 different doctors
