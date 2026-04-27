from flask import Flask, render_template, request
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(
    dbname="cafefinder",
    user="vaishak",   
    password="",
    host="localhost"
)

@app.route("/")
def home():
    search = request.args.get("search", "")
    wifi = request.args.get("wifi")
    outlets = request.args.get("outlets")

    query = "SELECT * FROM cafes WHERE name ILIKE %s"
    values = [f"%{search}%"]

    if wifi:
        query += " AND has_wifi = TRUE"

    if outlets:
        query += " AND has_outlets = TRUE"

    cur = conn.cursor()
    cur.execute(query, values)
    cafes = cur.fetchall()
    cur.close()

    return render_template("index.html", cafes=cafes)

if __name__ == "__main__":
    app.run(debug=True)