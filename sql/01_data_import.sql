CREATE DATABASE Outscraper_rawdata_csv;
USE Outscraper_rawdata_csv;

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
phone_1 NVARCHAR(MAX)
);
