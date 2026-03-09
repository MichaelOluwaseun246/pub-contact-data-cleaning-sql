/*
Project: Pub Contact Data Cleaning
Step 1: Import raw scraped dataset into SQL Server staging table

This script:
1. Creates the database
2. Creates a staging table
3. Imports the raw dataset using BULK INSERT
*/

CREATE DATABASE [Outscraper_rawdata_csv]

USE Outscraper_rawdata_csv;

IF OBJECT_ID('dbo.outscraper_stage_small', 'U') IS NOT NULL
    DROP TABLE dbo.outscraper_stage_small;

CREATE TABLE dbo.outscraper_stage_small (
    name NVARCHAR(MAX),
    name_for_emails NVARCHAR(MAX),
    type NVARCHAR(MAX),
    phone NVARCHAR(MAX),
    website NVARCHAR(MAX),
    address NVARCHAR(MAX),
    postal_code NVARCHAR(MAX),
    city NVARCHAR(MAX),
    county NVARCHAR(MAX),
    country NVARCHAR(MAX),
    email_1 NVARCHAR(MAX),
    email_1_full_name NVARCHAR(MAX),
    email_1_first_name NVARCHAR(MAX),
    email_1_last_name NVARCHAR(MAX),
    email_1_title NVARCHAR(MAX),
    email_1_phone NVARCHAR(MAX),
    email_2 NVARCHAR(MAX),
    email_2_full_name NVARCHAR(MAX),
    email_2_first_name NVARCHAR(MAX),
    email_2_last_name NVARCHAR(MAX),
    email_2_title NVARCHAR(MAX),
    email_2_phone NVARCHAR(MAX),
    email_3 NVARCHAR(MAX),
    email_3_full_name NVARCHAR(MAX),
    email_3_first_name NVARCHAR(MAX),
    email_3_last_name NVARCHAR(MAX),
    email_3_title NVARCHAR(MAX),
    email_3_phone NVARCHAR(MAX),
    phone_1 NVARCHAR(MAX),
    phone_2 NVARCHAR(MAX),
    phone_3 NVARCHAR(MAX)
);
BULK INSERT dbo.outscraper_stage_small
FROM 'data/Outscraper_rawdata_csv.txt'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);
