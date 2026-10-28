WITH date_ AS (
    SELECT DISTINCT
        CAST(date_of_birth AS DATE) AS [date]
    FROM {{ ref('obt_employees') }} 
    WHERE date_of_birth IS NOT NULL
)
SELECT
    CONVERT(INT, CONVERT(CHAR(8), [date], 112)) AS date_key, -- YYYYMMDD
    [date],
    YEAR([date]) AS [year],
    MONTH([date]) AS [month],
    DAY([date]) AS [day],
    DATENAME(MONTH, [date]) AS month_name,
    DATENAME(WEEKDAY, [date]) AS day_name
FROM date_;