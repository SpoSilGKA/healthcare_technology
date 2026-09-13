import psycopg2
from psycopg2.extras import RealDictCursor
from fastapi import FastAPI

app = FastAPI(title="Healthcare Lab Accessioning API")

def get_db_connection():
    return psycopg2.connect(
        host="localhost",
        database="laboratory_lims",
        user="lab_admin",
        password="SecretPassword123",
        port="5432"
    )

@app.get("/samples")
def get_samples():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    cursor.execute("SELECT * FROM sample_accession ORDER BY id ASC;")
    samples = cursor.fetchall()
    cursor.close()
    conn.close()
    return samples

