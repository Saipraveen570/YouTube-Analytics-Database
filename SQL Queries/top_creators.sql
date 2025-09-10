-- Top 10 channels by total views (US dataset)
SELECT channel_title,
       SUM(views) AS total_views,
       COUNT(DISTINCT video_id) AS videos_count,
       SAFE_DIVIDE(SUM(likes), SUM(views)) AS overall_like_rate
FROM `your_project.youtube_analytics.us_videos`
GROUP BY channel_title
ORDER BY total_views DESC
LIMIT 10;
