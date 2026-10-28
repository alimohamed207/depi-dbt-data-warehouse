# DEPI Data Warehouse | dbt & SQL Server

An end-to-end data transformation and data warehouse project built with **dbt Core** and **Microsoft SQL Server** as part of my Data Engineering learning journey with the Digital Egypt Pioneers Initiative (DEPI).

The project focuses on transforming raw employee data into clean, structured, and analytics-ready datasets using modular SQL models, dimensional modeling, and automated data quality tests.

## Project Overview

The project processes employee data containing information such as employee IDs, names, gender, email addresses, dates of birth, salaries, departments, and countries.

The main objectives are to:

- Build a structured data transformation pipeline using dbt.
- Clean and standardize raw employee data.
- Separate transformation logic into modular, reusable models.
- Design a dimensional data warehouse using fact and dimension tables.
- Implement data quality tests to validate data integrity and consistency.

## Architecture

```text
             Raw Employee Data
                     |
                     v
               dbt Seed Data
                     |
                     v
          ODS - Operational Data Store
                     |
                     v
          Staging / OBT Transformation
          - Data type casting
          - Text standardization
          - Email normalization
          - Salary cleaning
                     |
                     v
             Dimensional Modeling
                     |
          +----------+----------+
          |                     |
          v                     v
    Dimension Tables       Fact Table
          |                     |
          +----------+----------+
                     |
                     v
          Data Quality Testing
```

## Data Warehouse Design

The warehouse follows a dimensional modeling approach, organizing employee-related data into fact and dimension tables.

### Fact Table

**`fact_employee`**

Stores employee-level records and salary measures, along with references to relevant dimensions.

Potential analytical use cases include employee distribution, salary analysis, and workforce reporting.

### Dimension Tables

| Dimension | Purpose |
|---|---|
| `dim_employee` | Employee attributes and descriptive information |
| `dim_gender` | Standardized gender values |
| `dim_department` | Department information |
| `dim_country` | Country information |
| `dim_date` | Calendar attributes for date-based analysis |

The final table schemas and relationships are defined by the SQL models in the project.

## Data Transformation

The staging layer applies transformations such as:

- **Type conversion:** Safely converts employee IDs, dates, and numeric values into appropriate data types.
- **Text cleaning:** Removes unnecessary whitespace from text fields.
- **Email standardization:** Converts email addresses to lowercase.
- **Salary normalization:** Handles salary values using SQL Server-compatible transformations.
- **Dimensional preparation:** Organizes descriptive attributes and prepares data for downstream fact and dimension models.

The transformations use dbt's `ref()` function to establish model dependencies and maintain lineage between models.

## Data Quality Testing

The project includes dbt data tests designed to validate the transformed data, including:

- `not_null` checks for required fields.
- `unique` checks for employee identifiers and dimension keys.
- `relationships` checks between fact and dimension tables.
- `accepted_values` checks for constrained values.
- Custom SQL tests for business rules and dimensional key consistency.
- Salary validation to detect negative values.

Tests are executed through dbt and help identify data quality issues before the models are considered ready for downstream use.

## Tech Stack

- **dbt Core** — SQL-based data transformation and model orchestration.
- **Microsoft SQL Server** — Relational database and warehouse storage.
- **SQL / T-SQL** — Data transformation and validation.
- **Python** — Development environment and dbt tooling.
- **ODBC Driver for SQL Server** — Database connectivity.

## Project Structure

```text
depi-dbt-data-warehouse/
├── depi_dbt/
│   ├── models/
│   │   ├── staging/
│   │   ├── ...
│   ├── seeds/
│   ├── macros/
│   ├── tests/
│   ├── dbt_project.yml
│   └── ...
├── pyproject.toml
├── uv.lock
└── README.md
```

*The structure above is illustrative; directory names may vary based on the current project configuration.*

## Getting Started

### Prerequisites

- Python
- dbt Core with the SQL Server adapter
- Microsoft SQL Server
- Microsoft ODBC Driver for SQL Server
- A configured dbt profile for your SQL Server instance

### 1. Clone the repository

```bash
git clone https://github.com/alimohamed207/depi-dbt-data-warehouse.git
cd depi-dbt-data-warehouse
```

### 2. Navigate to the dbt project

```bash
cd depi_dbt
```

Run dbt commands from the directory containing `dbt_project.yml`. If the project is nested differently, navigate to its actual location.

### 3. Configure the database connection

Configure your dbt profile with the appropriate SQL Server connection details, including the server, database, schema, authentication method, and thread count.

Keep database credentials and passwords outside the repository. Never commit your personal `profiles.yml` or secrets.

### 4. Install dependencies

If the project uses dbt package dependencies, install them with:

```bash
dbt deps
```

### 5. Load seed data

```bash
dbt seed
```

### 6. Build models and run tests

```bash
dbt build
```

To build a specific model and its required upstream dependencies, use:

```bash
dbt build --select +obt_employees
```

### 7. Generate and serve dbt documentation

```bash
dbt docs generate
dbt docs serve
```

The generated documentation helps explore model descriptions, dependencies, and lineage.

## Key Learning Outcomes

This project provides practical experience with:

- Designing dbt transformation layers.
- Building modular SQL models and managing dependencies.
- Cleaning and standardizing employee datasets.
- Applying dimensional modeling concepts.
- Creating fact and dimension tables.
- Implementing automated data quality tests.
- Working with SQL Server-specific SQL syntax and data types.
- Documenting data models and transformation lineage.

## Future Improvements

- Add source freshness checks and source-level validation.
- Expand model documentation and column descriptions.
- Introduce reusable macros for common cleaning operations.
- Improve handling of invalid and missing data.
- Add incremental models where appropriate.
- Integrate automated testing into a CI/CD workflow.

## Author

**Ali Mohamed Eid Ahmed**

Aspiring Data Engineer with a Software Development background, interested in building reliable data pipelines, transforming raw data into analytics-ready datasets, and designing maintainable data warehouse solutions.

- GitHub: [@alimohamed207](https://github.com/alimohamed207)
- Project Repository: [depi-dbt-data-warehouse](https://github.com/alimohamed207/depi-dbt-data-warehouse)

---

*Built as part of my ongoing Data Engineering learning journey.*
