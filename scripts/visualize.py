# visualize.py
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import psycopg2

# Connect to PostgreSQL database
conn = psycopg2.connect(
    dbname="your_db",
    user="your_user",
    password="your_password",
    host="localhost",
    port="5432"
)

# Example: Total sales per month
query = """
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(p.price * oi.quantity) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;
"""

df = pd.read_sql(query, conn)

plt.figure(figsize=(10,5))
sns.lineplot(data=df, x='month', y='total_sales', marker='o')
plt.title('Total Sales Per Month')
plt.xlabel('Month')
plt.ylabel('Total Sales')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

conn.close()
