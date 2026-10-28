# DEPI dbt analytics project

This project builds employee data through an ODS layer, a staging layer, and a
data warehouse (DWH) layer using the SQL Server adapter.

## Data layers

- **ODS** (`models/ods`): exposes the loaded `DEPI_data` seed as a view.
- **Staging** (`models/staging`, schema suffix `stg`): cleans source fields in
  `obt_employees` and builds employee, country, department, gender, and date
  dimensions.
- **DWH** (`models/DWH`, schema suffix `dwh`): builds `fact_employee` at one row
  per employee with foreign keys to the staging dimensions.

The project’s `generate_schema_name` macro uses the configured custom schema
name as the complete schema name. Configure the dbt SQL Server profile with a
database and a target schema that the connected user can create objects in.

## Build and validate

From the `depi_dbt` project directory, load the seed before running the models:

```shell
dbt seed
dbt run
dbt test
```

The staging and DWH model contracts and generic tests are defined separately
in `models/staging/schema.yml` and `models/DWH/schema.yml`. Reusable custom
tests (`non_negative`, `not_empty`, and `unique_combination_of_columns`) and
the `clean_currency` SQL Server conversion macro are in `macros/`. Singular
tests in `tests/` assert that cleaned employee records are usable and that
the DWH fact has all required dimension keys.

To build a single layer, use `dbt run --select path:models/staging` or
`dbt run --select path:models/DWH`. To build the DWH fact together with all
upstream model dependencies, use `dbt build --select +fact_employee`.
