# Upload CSV to GCS then load into BigQuery (bash)
# 1. Upload to GCS
gsutil cp dataset/USvideos_clean.csv gs://<your-bucket>/USvideos_clean.csv

# 2. Load to BigQuery (creates table with autodetect schema)
bq load --autodetect --source_format=CSV \
  --skip_leading_rows=1 \
  --allow_quoted_newlines \
  --allow_jagged_rows \
  your_project:youtube_analytics.us_videos \
  gs://<your-bucket>/USvideos_clean.csv
