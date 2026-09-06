/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

use master;
go

  --Drop and recreate the datawarehouse
if exists(select 1 from sys.databases where name='datawarehouse')
begin
  alter database datawarehouse set SINGLE_USER with rollback immediate;
  drop database datawarehouse;
end;
go

--Create a datawarehouse
create database datawarehouse;
go

use datawarehouse;
go

--create schemas
create schema bronze;
go

create schema silver;
go

create schema gold;
go
