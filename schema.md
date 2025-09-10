# Schema for USvideos_clean.csv

Use this schema if you want to define types manually during table creation in BigQuery.

- video_id: STRING
- trending_date: STRING
- title: STRING
- channel_title: STRING
- category_id: INT64
- publish_time: TIMESTAMP
- tags: STRING
- views: INT64
- likes: INT64
- dislikes: INT64
- comment_count: INT64
- thumbnail_link: STRING
- comments_disabled: BOOL
- ratings_disabled: BOOL
- video_error_or_removed: BOOL
- description: STRING

Notes:
- `publish_time` should parse automatically to TIMESTAMP. If not, consider using `PARSE_TIMESTAMP` during ETL.
- If you choose ingestion-time partitioning, consider adding a `date` column derived from `publish_time`.
