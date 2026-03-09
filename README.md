# SQL Sales Analytics

A project demonstrating advanced SQL analytics and visualization using PostgreSQL.  
This repository is designed to showcase **database design, advanced queries, and data analysis skills**.

---

## Features

- Database schema for sales analytics: `customers`, `products`, `orders`, `order_items`
- Sample data to run queries immediately
- Advanced SQL queries:
  - Total sales per month
  - Top customers by revenue
  - Top-selling products
  - Year-over-year sales growth
  - Cohort analysis and window functions
- Optional Python visualizations

---
psql -d sales_analytics -f db/queries.sql
python scripts/visualize.py

## Project Structure
---

## Getting Started

1. **Create database** (PostgreSQL):

```bash
createdb sales_analytics
psql -d sales_analytics -f db/schema.sql
psql -d sales_analytics -f db/seed_data.sql
