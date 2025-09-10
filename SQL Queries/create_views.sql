-- View: quick channel-level metrics
CREATE OR REPLACE VIEW `your_project.youtube_analytics.vw_channel_metrics` AS
SELECT channel_title,
       COUNT(DISTINCT video_id) AS total_videos,
       SUM(views) AS total_views,
       SUM(likes) AS total_likes,
       SUM(comment_count) AS total_comments,
       SAFE_DIVIDE(SUM(likes + comment_count), SUM(views)) AS engagement_rate
FROM `your_project.youtube_analytics.us_videos`
GROUP BY channel_title;
