# YouTube Analytics - BigQuery Project

This repository contains an end-to-end SQL project built for Google Data Apprenticeship practice.
It uses the cleaned Kaggle "USvideos" dataset and demonstrates ingestion into BigQuery,
data modeling (partitioning + clustering), analytic queries, and suggestions for visualization.

## Folder structure
```
youtube-analytics-bigquery-project/
├── dataset/
│   └── USvideos_clean.csv       # cleaned CSV (ready for upload)
├── bigquery/
│   ├── create_table.sql         # DDL to create partitioned/clusted table
│   └── load_table_cli.sh        # bq + gsutil commands for loading CSV
├── queries/
│   ├── top_creators.sql
│   ├── category_engagement.sql
│   ├── retention_analysis.sql
│   ├── monthly_trends.sql
│   ├── channel_daily_aggregates.sql
│   └── create_views.sql
├── docs/
│   └── schema.md
└── README.md
```

---
## Quickstart (BigQuery UI)
1. Open Google Cloud Console → BigQuery.
2. Create a dataset named: `youtube_analytics` (or your preferred name).
3. Upload the CSV:
   - Click **Create Table** → **Upload** → select `dataset/USvideos_clean.csv`.
   - File format: `CSV`.
   - Skip header rows: `1`.
   - Field delimiter: `,` and Quote: `"`
   - Schema: Use the provided schema in `docs/schema.md` or let BigQuery auto-detect.
   - Advanced: For best performance, consider creating a partitioned & clustered table (see `bigquery/create_table.sql`).
4. After table creation, run SQL queries from the `queries/` folder in the BigQuery editor.

## Quickstart (gcloud + bq CLI + GCS)
1. Upload CSV to Google Cloud Storage:
   ```bash
   gsutil cp dataset/USvideos_clean.csv gs://<your-bucket>/USvideos_clean.csv
   ```
2. Load into BigQuery (example):
   ```bash
   bq load --autodetect --source_format=CSV      --skip_leading_rows=1      --allow_quoted_newlines      --allow_jagged_rows      your_project:youtube_analytics.us_videos      gs://<your-bucket>/USvideos_clean.csv
   ```

## Next steps & extensions
- Build a Looker Studio dashboard using the BigQuery table as a data source.
- Create scheduled queries to maintain daily/weekly aggregates.
- Add BigQuery ML models for view/engagement forecasting.
- Combine other regional CSVs (IN, GB) and create a unified 'all_videos' table with a `region` column.

---
## Notes on cost & performance
- Use `PARTITION BY DATE(publish_time)` and `CLUSTER BY channel_title, category_id` to reduce query cost.
- Preview results or use `LIMIT` before running wide `SELECT *` queries to avoid scanning the entire table.
- Use `SELECT ... FROM table WHERE _PARTITIONTIME BETWEEN ...` or `DATE(publish_time)` filters when querying partitioned tables.

---
