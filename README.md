# 🏬 Retail Data Warehouse Project (Medallion Architecture)

## 📌 Overview

This project demonstrates the design and implementation of a **Retail Data Warehouse** using the **Medallion Architecture (Bronze → Silver → Gold)** approach.

The goal is to build a scalable, production-ready data pipeline that ingests raw data, performs data cleaning and transformations, and delivers business-ready datasets for analytics and reporting.

---

## 🏗️ Architecture

### 🔹 Medallion Architecture Layers

#### 🟤 Bronze Layer (Raw Data)

* Stores raw, unprocessed data as-is from source systems
* Data is ingested from CSV files
* No transformations applied

#### ⚪ Silver Layer (Cleaned Data)

* Data is cleaned and standardized
* Handles:

  * Missing values
  * Duplicate removal
  * Data type corrections
  * Anomaly handling

#### 🟡 Gold Layer (Business Data)

* Aggregated and transformed datasets
* Optimized for reporting and analytics
* Includes business metrics and KPIs

---

## 📂 Project Structure

```
DataWarehouse Project/
│
├── Dataset/
│   ├── customers.csv
│   ├── orders.csv
│   └── products.csv
│
├── SQL Queries/
│   └── SQL Script.sql
│
└── README.md
```

---

## 🗄️ Database Design

* Database Name: `tdb`
* Schemas:

  * `bronze`
  * `silver`
  * `gold`

### Tables Created

#### Bronze Layer

* `bronze.customers`
* `bronze.orders`
* `bronze.products`

#### Silver Layer

* Cleaned versions of bronze tables

#### Gold Layer

* Business-level tables (fact & dimension models)

---

## 🔄 Data Pipeline Flow

```
CSV Files → Bronze → Silver → Gold → Analytics / BI
```

---

## ⚙️ Current Progress (WIP)

✅ Database and schemas created
✅ Raw data loaded into Bronze layer
✅ Initial data exploration and anomaly identification started

---

## 🔜 Upcoming Enhancements

* 🔹 Data cleaning and transformation (Bronze → Silver)
* 🔹 Business logic implementation (Silver → Gold)
* 🔹 Incremental data loading (handling new/updated records)
* 🔹 Automated pipeline orchestration
* 🔹 Scheduling jobs (daily/real-time ingestion)
* 🔹 Performance optimization
* 🔹 Power BI dashboard integration (optional)

---

## 📊 Example Use Cases

* Customer purchase analysis
* Sales trends over time
* Product performance tracking
* Revenue insights

---

## 🛠️ Tech Stack

* SQL (Core transformations)
* Data Warehouse concepts
* Medallion Architecture
* CSV data sources
* (Planned) ETL/ELT pipelines
* (Planned) Power BI

---

## 💡 Key Concepts Covered

* Data Warehousing
* Medallion Architecture
* Data Cleaning & Transformation
* Incremental Load Strategy
* Pipeline Automation
* Dimensional Modeling

---

## 🚀 Future Scope

* Implement Slowly Changing Dimensions (SCD)
* Add logging and monitoring
* Build production-grade ETL pipelines
