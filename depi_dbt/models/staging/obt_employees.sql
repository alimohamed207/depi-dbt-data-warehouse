
SELECT
    TRY_CAST([Id] AS INT) AS employee_id,
    TRIM([first_name]) AS first_name,
    TRIM([last_name]) AS last_name,
    TRIM([gender]) AS gender,
    LOWER(TRIM([email])) AS email,
    TRY_CAST([DOB] AS DATE) AS date_of_birth,
    TRY_CAST([salary] AS DECIMAL(18,2)) AS salary,
    TRIM([department]) AS department,
    TRIM([country]) AS country

FROM {{ ref('ods_employees') }}
