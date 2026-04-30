# ☕ Cafe Finder

## Overview

Cafe Finder is a full-stack web application that helps users discover and filter cafes based on study-friendly features such as WiFi availability and power outlets. It is built using Flask for the backend and PostgreSQL for the database, with a simple HTML/CSS frontend for interaction.

The application focuses on integrating relational database design with dynamic query handling in a web environment. Users can search for cafes, apply filters, and view results that are rendered in real time.

![Uploading Cafefind.png…]()

---

## Why I Built This

I built this project to improve my understanding of full-stack development, especially how backend systems interact with databases and frontend interfaces.

I was particularly interested in learning how SQL queries can be dynamically constructed based on user input, and how relational databases can be structured to support real-world applications like reviews, saved items, and filtering systems.

This project also helped me strengthen my understanding of Flask routing, database joins, and template rendering using Jinja2.

---

## Features

### Core Features

**Cafe Search System**  
Users can search for cafes by name using partial, case-insensitive matching.

**Filter System**  
Cafes can be filtered based on:
- WiFi availability
- Power outlet availability

**Dynamic Results Rendering**  
Search results are dynamically generated using Flask and displayed using Jinja2 templates.

---

### Advanced Features

**Relational Database Integration**  
The system uses a structured PostgreSQL database with multiple related tables:
- users
- cafes
- reviews
- saved_cafes

**Review System (Backend Support)**  
Each cafe can store multiple ratings such as:
- Quietness
- Comfort
- Outlet availability
- Overall rating

**Saved Cafes System**  
Users can bookmark cafes for later reference using a many-to-many relationship table.

**SQL Analytics Queries**  
Includes advanced queries such as:
- Ranking cafes by study score
- Finding quiet cafes with WiFi
- Identifying saved cafes without reviews

---

## Tech Stack

- **Backend:** Python (Flask)
- **Database:** PostgreSQL (psycopg2)
- **Frontend:** HTML, CSS
- **Templating:** Jinja2

---

## Project Structure

```bash
Cafe_Finder/
│
├── app.py              # Flask backend (routing + database queries)
├── database/
│   └── schema.sql          # Database schema (table definitions)
│   └── sample_data.sql     # Sample dataset for testing
│   └── queries.sql         # SQL analytics and complex queries
│
├── templates/
│   └── index.html      # Frontend UI template 
│
├── static/
│   ├── style.css       # Styling for the UI
│   └── wood_table.jpg  # Background image asset
│
└── README.md
```
---

## Backend Overview (app.py)

The Flask backend handles all core application logic.

It's responsible for:

- Connecting to the PostgreSQL database using psycopg2
- Handling HTTP requests from the frontend
- Reading user input from the search bar and filters
- Dynamically constructing SQL queries based on user input
- Executing queries and fetching results

The filtering system modifies the SQL query only when filters are selected, ensuring flexibility and efficiency.

## Database Design

The system uses a relational database with four main tables:

**Users**
- user_id (Primary Key)
- username
- email
- created_at

---
**Cafes**
- cafe_id (Primary Key)
- name
- location
- has_wifi (BOOLEAN)
- has_outlets (BOOLEAN)

---
**Reviews**
- review_id (Primary Key)
- user_id (Foreign Key)
- cafe_id (Foreign Key)
- quietness_rating
- comfort_rating
- outlet_rating
- overall_rating
- comment
- created_at

---
**Saved Cafes**
- user_id (Foreign Key)
- cafe_id (Foreign Key)
- saved_at
- Composite Primary Key (user_id, cafe_id)

---

## How to Run

### 1. Clone the repository

```bash
git clone https://github.com/your-username/Cafe_Finder.git
cd Cafe_Finder
```

### 2. Create database

```bash
CREATE DATABASE cafefinder;
```

### 3. Run schema and sample data

```bash
psql -U your_username -d cafefinder -f schema.sql
psql -U your_username -d cafefinder -f sample_data.sql
```

### 4. Install dependencies

```bash
pip install flask psycopg2
```

### 5. Configure database connection

```bash
conn = psycopg2.connect(
    dbname="cafefinder",
    user="your_username",
    password="your_password",
    host="localhost"
)
```

### 6. Run the application

```bash
python app.py
```

### Open in browser:

```bash
http://127.0.0.1:5000/
```
---

## Experiments and Observations
### Dynamic SQL Construction

Building queries dynamically based on user input allows flexible filtering but requires careful handling to avoid unnecessary conditions.

### Database Relationships

Using foreign keys between users, cafes, and reviews ensures data consistency and reflects real-world relational structures.

### Template Rendering

Jinja2 allows backend data to be injected directly into HTML templates, simplifying frontend logic.

### System Design Insight

The project demonstrates how backend logic, database structure, and frontend rendering work together in a full-stack application.

---

## Limitations
- No authentication system
- No frontend interactivity beyond filtering
- No API layer (Flask renders pages directly)
- No deployment setup
- No user-generated review input through UI

## Future Improvements
- Add user authentication (login/signup)
- Allow users to submit reviews through UI
- Add interactive map integration (Google Maps API)
- Deploy application (Render / Railway / Vercel)
- Add sorting and ranking features
- Improve UI/UX design
- Add recommendation system based on ratings

---

## Conclusion

Cafe Finder demonstrates how Flask, PostgreSQL, and frontend templates can be combined into a functional full-stack application.

---

## Status

✔ Completed
✔ Fully Functional
✔ Available on GitHub
