-- DDL: create a partitioned & clustered table in BigQuery
-- Replace `your_project` with your GCP project id and run in BigQuery Console or via bq CLI.
CREATE OR REPLACE TABLE `your_project.youtube_analytics.us_videos` (
  video_id STRING,
  trending_date STRING,
  title STRING,
  channel_title STRING,
  category_id INT64,
  publish_time TIMESTAMP,
  tags STRING,
  views INT64,
  likes INT64,
  dislikes INT64,
  comment_count INT64,
  thumbnail_link STRING,
  comments_disabled BOOL,
  ratings_disabled BOOL,
  video_error_or_removed BOOL,
  description STRING
)
PARTITION BY DATE(publish_time)
CLUSTER BY channel_title, category_id;
