# Stockholm Airbnb — dbt Guided Project

A hands-on dbt learning project where students build a data pipeline from raw Airbnb data to clean analytics-ready tables.

## The Dataset

Stockholm Airbnb data with two raw tables:

| Table | Rows | Description |
|---|---|---|
| `raw_listings` | 8,517 | Airbnb listings with host info, pricing, review scores, availability |
| `raw_reviews` | 161,036 | Guest reviews with reviewer info and comments |

## Session Goals

Students will build three **staging models** that transform the raw data:

1. **`src_listings`** — Clean listing data (rename columns, convert price from text to number, convert boolean t/f to TRUE/FALSE)
2. **`src_hosts`** — Unique hosts deduplicated from listings (introduce `QUALIFY ROW_NUMBER()` pattern)
3. **`src_reviews`** — Clean review data (rename columns, keep as-is otherwise)

These models are the foundation for any downstream analytics tables or dashboards.

## Quick Start (After Setup)

```bash
# Verify connection to BigQuery
dbt debug

# Load raw CSV data into BigQuery
dbt seed

# Run all staging models
dbt run --select staging

# View the documentation (optional)
dbt docs generate
dbt docs serve
```

## Useful dbt Commands

```bash
dbt debug                          # Test your connection to BigQuery
dbt seed                           # Load the CSV files into BigQuery as raw tables
dbt run                            # Run all models
dbt run --select staging           # Run only staging models
dbt run --select src_listings      # Run a specific model
dbt test                           # Run all tests
dbt build                          # Seed + run + test in one command
dbt docs generate                  # Generate documentation
dbt docs serve                     # View documentation in browser (http://localhost:8000)
```
