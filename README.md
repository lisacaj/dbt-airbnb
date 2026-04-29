# AIRBNB — DBT Starter Project

## Before the day

Follow the **pre-setup guide** shared by your instructor to get your environment ready. You should complete this **before** the session.

By the end of the setup guide your environment will be fully configured and `dbt debug` will return all green.

## What's in this repo

```
airbnb/
├── dbt_project.yml          # Project configuration
├── profiles.yml.example     # Template — copy to ~/.dbt/profiles.yml
├── seeds/                   # Raw data CSV files
│   ├── raw_listings.csv
│   └── raw_reviews.csv
├── models/
│   ├── sources.yml          # Source definitions
│   ├── staging/             # You will build your staging models here
│   └── marts/               # You will build your mart models here
├── tests/                   # You will add tests here
└── macros/                  # Available for macros if needed
```

## The dataset

The data is AIRBNB data for listings in Stockholm. The raw data contains two tables:

| Table | Description |
|---|---|
| `raw_customers` | One row per listing |
| `raw_review` | One row per review |

## Useful commands

```bash
dbt debug          # Test your connection
dbt seed           # Load the CSV files into BigQuery
dbt run            # Run all models
dbt test           # Run all tests
dbt build          # Seed + run + test in one command
dbt docs generate  # Generate documentation
dbt docs serve     # View documentation in browser
```
