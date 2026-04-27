CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cafes (
    cafe_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    has_wifi BOOLEAN,
    has_outlets BOOLEAN
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    cafe_id INT REFERENCES cafes(cafe_id),

    quietness_rating INT CHECK (quietness_rating BETWEEN 1 AND 5),
    comfort_rating INT CHECK (comfort_rating BETWEEN 1 AND 5),
    outlet_rating INT CHECK (outlet_rating BETWEEN 1 AND 5),
    overall_rating INT CHECK (overall_rating BETWEEN 1 AND 5),

    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE saved_cafes (
    user_id INT REFERENCES users(user_id),
    cafe_id INT REFERENCES cafes(cafe_id),
    saved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (user_id, cafe_id)
);