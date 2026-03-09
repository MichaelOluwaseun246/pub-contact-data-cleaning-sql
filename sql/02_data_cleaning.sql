/*
Project: Pub Contact Data Cleaning
Step 2: Clean and standardize scraped business contact data

This script:
1. Trims whitespace from fields
2. Selects the first valid email address
3. Selects the first available phone number
4. Creates a cleaned contact dataset
*/

IF OBJECT_ID('dbo.cleaned_contacts', 'U') IS NOT NULL
    DROP TABLE dbo.cleaned_contacts;

WITH cleaned AS (
    SELECT
        LTRIM(RTRIM(name)) AS name,

        NULLIF(LTRIM(RTRIM(website)), '') AS website,

        CASE
            WHEN NULLIF(LTRIM(RTRIM(email_1)), '') IS NOT NULL
                 AND email_1 LIKE '%@%'
                 AND email_1 NOT LIKE 'u003e%'
            THEN LTRIM(RTRIM(email_1))

            WHEN NULLIF(LTRIM(RTRIM(email_2)), '') IS NOT NULL
                 AND email_2 LIKE '%@%'
                 AND email_2 NOT LIKE 'u003e%'
            THEN LTRIM(RTRIM(email_2))

            WHEN NULLIF(LTRIM(RTRIM(email_3)), '') IS NOT NULL
                 AND email_3 LIKE '%@%'
                 AND email_3 NOT LIKE 'u003e%'
            THEN LTRIM(RTRIM(email_3))

            ELSE NULL
        END AS email_address,

        CASE
            WHEN NULLIF(LTRIM(RTRIM(phone)), '') IS NOT NULL
            THEN LTRIM(RTRIM(phone))

            WHEN NULLIF(LTRIM(RTRIM(phone_1)), '') IS NOT NULL
            THEN LTRIM(RTRIM(phone_1))

            WHEN NULLIF(LTRIM(RTRIM(phone_2)), '') IS NOT NULL
            THEN LTRIM(RTRIM(phone_2))

            WHEN NULLIF(LTRIM(RTRIM(phone_3)), '') IS NOT NULL
            THEN LTRIM(RTRIM(phone_3))

            ELSE NULL
        END AS telephone_number,

        NULLIF(LTRIM(RTRIM(address)), '') AS address,
        NULLIF(LTRIM(RTRIM(postal_code)), '') AS post_code,
        NULLIF(LTRIM(RTRIM(city)), '') AS location_city

    FROM dbo.outscraper_stage_small
)
SELECT DISTINCT
    name,
    website,
    email_address,
    telephone_number,
    address,
    post_code,
    location_city
INTO dbo.cleaned_contacts
FROM cleaned
WHERE name IS NOT NULL
  AND name <> ''
  AND (
        email_address IS NOT NULL
        OR telephone_number IS NOT NULL
      );
