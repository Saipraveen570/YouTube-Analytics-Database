-- Create or replace a table with daily channel aggregates
CREATE OR REPLACE TABLE `your_project.youtube_analytics.channel_daily_metrics` AS
SELECT
  channel_title,
  DATE(publish_time) AS date,
  COUNT(DISTINCT video_id) AS videos_published,
  SUM(views) AS views,
  SUM(likes) AS likes,
  SUM(comment_count) AS comments
FROM `your_project.youtube_analytics.us_videos`
GROUP BY channel_title, date;
