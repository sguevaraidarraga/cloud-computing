import os
import psycopg
from flask import Flask, jsonify, request

app = Flask(__name__)
INSTANCE = os.getenv("INSTANCE", "api-local")


def get_conn():
    return psycopg.connect(
        host=os.environ["DB_HOST"],
        dbname=os.environ["DB_NAME"],
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"],
    )


def to_dict(r):
    return {"id": r[0], "name": r[1], "price": float(r[2])}


@app.get("/products")
def list_products():
    with get_conn() as conn, conn.cursor() as cur:
        cur.execute("SELECT id, name, price FROM products ORDER BY id")
        rows = [to_dict(r) for r in cur.fetchall()]
    return jsonify({"served_by": INSTANCE, "products": rows})


@app.get("/products/<int:pid>")
def get_product(pid):
    with get_conn() as conn, conn.cursor() as cur:
        cur.execute("SELECT id, name, price FROM products WHERE id = %s", (pid,))
        r = cur.fetchone()
    if r is None:
        return jsonify({"served_by": INSTANCE, "error": "not found"}), 404
    return jsonify({"served_by": INSTANCE, "product": to_dict(r)})


@app.post("/products")
def create_product():
    data = request.get_json()
    with get_conn() as conn, conn.cursor() as cur:
        cur.execute("INSERT INTO products (name, price) VALUES (%s, %s) RETURNING id, name, price",
                    (data["name"], data["price"]))
        r = cur.fetchone()
    return jsonify({"served_by": INSTANCE, "product": to_dict(r)}), 201


@app.put("/products/<int:pid>")
def update_product(pid):
    data = request.get_json()
    with get_conn() as conn, conn.cursor() as cur:
        cur.execute("UPDATE products SET name = %s, price = %s WHERE id = %s RETURNING id, name, price",
                    (data["name"], data["price"], pid))
        r = cur.fetchone()
    if r is None:
        return jsonify({"served_by": INSTANCE, "error": "not found"}), 404
    return jsonify({"served_by": INSTANCE, "product": to_dict(r)})


@app.delete("/products/<int:pid>")
def delete_product(pid):
    with get_conn() as conn, conn.cursor() as cur:
        cur.execute("DELETE FROM products WHERE id = %s", (pid,))
        borrados = cur.rowcount
    if borrados == 0:
        return jsonify({"served_by": INSTANCE, "error": "not found"}), 404
    return jsonify({"served_by": INSTANCE, "deleted": pid})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
