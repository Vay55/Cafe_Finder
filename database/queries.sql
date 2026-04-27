
-- goated cafes for studying
SELECT 
    c.name,
    ROUND(AVG(
        (r.quietness_rating + r.comfort_rating + r.outlet_rating)::numeric / 3
    ),2) AS study_score
FROM cafes c
JOIN reviews r ON c.cafe_id = r.cafe_id
GROUP BY c.name
ORDER BY study_score DESC;

-- shush cafes With wifi
SELECT 
    c.name,
    ROUND(AVG(r.quietness_rating),2) AS avg_quietness
FROM cafes c
JOIN reviews r ON c.cafe_id = r.cafe_id
WHERE c.has_wifi = TRUE
GROUP BY c.name
HAVING AVG(r.quietness_rating) >= 4
ORDER BY avg_quietness DESC;

-- cafe saved but no reviews
SELECT 
    u.username,
    c.name
FROM saved_cafes s
JOIN users u ON s.user_id = u.user_id
JOIN cafes c ON s.cafe_id = c.cafe_id
LEFT JOIN reviews r 
ON r.user_id = s.user_id 
AND r.cafe_id = s.cafe_id
WHERE r.review_id IS NULL;