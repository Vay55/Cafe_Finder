-- Users
INSERT INTO users (username, email) VALUES
('vaishak', 'vaishak@email.com'),
('emma', 'emma@email.com'),
('ryo', 'ryo@email.com');

-- Cafes
INSERT INTO cafes (name, location, has_wifi, has_outlets) VALUES
('Blue Bottle Cafe', 'Tokyo Shibuya', TRUE, TRUE),
('Streamer Coffee', 'Tokyo Harajuku', TRUE, FALSE),
('Cafe Kitsune', 'Tokyo Aoyama', TRUE, TRUE),
('Quiet Corner Cafe', 'Tokyo Shinjuku', FALSE, TRUE),
('Study Hub Coffee', 'Tokyo Ikebukuro', TRUE, TRUE);

-- Reviews
INSERT INTO reviews (
user_id, cafe_id,
quietness_rating,
comfort_rating,
outlet_rating,
overall_rating,
comment
) VALUES
(1,1,4,5,5,5,'Great for studying'),
(2,1,3,4,5,4,'Busy but nice'),
(1,2,2,4,1,3,'Too loud sometimes'),
(3,3,5,4,4,5,'Excellent atmosphere'),
(2,4,5,3,5,4,'Very quiet place'),
(1,5,4,5,5,5,'Perfect study cafe');

-- Saved Cafes
INSERT INTO saved_cafes (user_id, cafe_id) VALUES
(1,1),
(1,5),
(2,3),
(3,1);