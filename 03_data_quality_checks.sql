/*
Project: Pub Contact Data Cleaning
Step 3: Data quality checks and validation
*/


SELECT COUNT(*) AS total_cleaned_records
FROM dbo.cleaned_contacts;

SELECT
    SUM(CASE WHEN website IS NULL THEN 1 ELSE 0 END) AS missing_website,
    SUM(CASE WHEN email_address IS NULL THEN 1 ELSE 0 END) AS missing_email,
    SUM(CASE WHEN telephone_number IS NULL THEN 1 ELSE 0 END) AS missing_telephone,
    SUM(CASE WHEN address IS NULL THEN 1 ELSE 0 END) AS missing_address,
    SUM(CASE WHEN post_code IS NULL THEN 1 ELSE 0 END) AS missing_post_code,
    SUM(CASE WHEN location_city IS NULL THEN 1 ELSE 0 END) AS missing_city
FROM dbo.cleaned_contacts;

SELECT
    name,
    post_code,
    COUNT(*) AS duplicate_count
FROM dbo.cleaned_contacts
GROUP BY name, post_code
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;
