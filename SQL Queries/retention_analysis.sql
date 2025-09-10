-- Videos with high views but low like-to-view ratio (<2%)
SELECT video_id, title, channel_title, views, likes, comment_count,
       SAFE_DIVIDE(likes, views) AS like_ratio
FROM `your_project.youtube_analytics.us_videos`
WHERE views > 100000
  AND SAFE_DIVIDE(likes, views) < 0.02
ORDER BY like_ratio ASC
LIMIT 50;
