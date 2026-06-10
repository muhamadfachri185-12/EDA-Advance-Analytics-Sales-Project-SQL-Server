-- Explore All Onjects in the Database

Select * From INFORMATION_SCHEMA.TABLES

-- Explore All Columns in the Database
Select * From INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'dim_customers'