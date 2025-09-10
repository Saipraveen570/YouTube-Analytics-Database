-- Category-level engagement: avg likes+comments and engagement rate
SELECT category_id,
       COUNT(*) AS videos,
       AVG(likes + comment_count) AS avg_engagement,
       SAFE_DIVIDE(AVG(likes + comment_count), AVG(views)) AS avg_engagement_rate
FROM `your_project.youtube_analytics.us_videos`
GROUP BY category_id
ORDER BY avg_engagement DESC;
