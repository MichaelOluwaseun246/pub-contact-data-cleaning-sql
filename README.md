# Pub Contact Data Cleaning (SQL)

This project demonstrates a SQL data-cleaning pipeline for business contact data scraped from the web.

The goal was to transform raw scraped data into a structured dataset that can be used for analysis or outreach.

## Data Pipeline Overview

Raw scraped data  
↓  
SQL staging table  
↓  
Data cleaning and standardisation  
↓  
Validated contact dataset

## Project Structure

sql/
- 01_data_import.sql → creates database and staging table
- 02_data_cleaning.sql → cleans and standardises the dataset
- 03_data_quality_checks.sql → validates the cleaned dataset

## Key Data Cleaning Tasks

- Trim whitespace from fields
- Select first valid email address
- Select first available phone number
- Remove empty or invalid values
- Standardise address and location fields

## Data Validation

Quality checks were performed to:

- Count total cleaned records
- Identify missing fields
- Detect potential duplicates

## Tools Used

- SQL Server
- T-SQL
- Data cleaning techniques
- Data validation queries

## Outcome

The result is a cleaned and validated dataset of business contact information that can be used for further analysis, reporting, or outreach activities.
