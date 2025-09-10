-- Monthly trend of uploads and views
WITH monthly_stats AS (
  SELECT FORMAT_DATE('%Y-%m', DATE(publish_time)) AS month,
         COUNT(DISTINCT video_id) AS uploads,
         SUM(views) AS total_views
  FROM `your_project.youtube_analytics.us_videos`
  GROUP BY month
)
SELECT month, uploads, total_views,
       SUM(total_views) OVER (ORDER BY month) AS cumulative_views
FROM monthly_stats
ORDER BY month;
