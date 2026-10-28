{% macro clean_currency(expression) -%}
    TRY_CONVERT(
        DECIMAL(12, 2),
        NULLIF(REPLACE(REPLACE(TRIM({{ expression }}), '$', ''), ',', ''), '')
    )
{%- endmacro %}
