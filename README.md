# 🏬 Retail Data Warehouse Project (Medallion Architecture)

## 📌 Overview

This project demonstrates the design and implementation of a **Retail Data Warehouse** using the **Medallion Architecture (Bronze → Silver → Gold)** approach.

The objective is to build a **scalable, production-ready data pipeline** that ingests raw data, manages data transformations, and delivers business-ready datasets for analytics and reporting.

This project is currently **Work In Progress (WIP)** with continuous enhancements being added.

---

## 🏗️ Architecture

### 🔹 Medallion Architecture Layers

#### 🟤 Bronze Layer (Raw Data)

* Stores raw data ingested from source systems (CSV files)
* Implements **full load strategy (truncate + reload)**
* No transformations applied
* Designed to preserve raw structure for traceability

---

#### ⚪ Silver Layer (Cleaned Data) *(In Progress)*

* Data cleaning and standardization
* Planned transformations:

  * Handling missing values
  * Duplicate removal
  * Data type corrections
  * Data quality checks

---

#### 🟡 Gold Layer (Business Data) *(Planned)*

* Aggregated and business-level datasets
* Optimized for reporting and analytics
* Will include KPIs and dimensional models

---

## 📂 Updated Project Structure

```
DataWarehouse Project/
│
├── Dataset/
│   ├── customers.csv
│   ├── orders.csv
│   └── products.csv
│
├── SQL Queries/
│   ├── Bronze_layer.sql
│   ├── DB&Schema_layers.sql
│   ├── Quality_checks.sql
│   └── stored_procedures.sql
│
└── README.md
```

---

## 🗄️ Database Design

* **Database Name:** `tdb`
* **Schemas:**

  * `bronze`
  * `silver`
  * `gold`

---

## 🧱 Tables (Current Status)

### Bronze Layer

* `bronze.customers`
* `bronze.orders`
* `bronze.products`

✔ Tables are created with **existence checks (`IF NOT EXISTS`)**
✔ Scripts are **idempotent (safe to re-run)**

---

## 🔄 Data Loading Strategy (Updated)

### 🔹 Bronze Layer Loading

* Implemented **TRUNCATE + BULK INSERT**
* Ensures fresh full load from source files
* Avoids duplicate accumulation

---

### 🔹 Stored Procedure Implementation

* Created reusable stored procedures for:

  * Bulk loading data into Bronze tables
* Improves:

  * Reusability
  * Automation readiness
  * Maintainability

---

## ⚙️ Key Enhancements Made

✅ Added **schema existence checks** using `SCHEMA_ID()`
✅ Added **table existence checks** using `OBJECT_ID()`
✅ Converted scripts into **idempotent scripts**
✅ Implemented **TRUNCATE + BULK INSERT strategy**
✅ Created **stored procedures for bulk load automation**
✅ Organized SQL scripts into modular files

---

## 🔄 Data Pipeline Flow

```
CSV Files → Bronze (Full Load) → Silver (Clean) → Gold (Business) → BI / Analytics
```

---

## 📊 Current Progress

✅ Database and schemas created
✅ Bronze tables created with validation checks
✅ Bulk data loading implemented via stored procedures
✅ Data successfully loaded into Bronze layer
✅ Query structure modularized and organized

---

## 🔜 Upcoming Enhancements

* 🔹 Build **Silver Layer transformations**
* 🔹 Implement **incremental loading (Silver layer)**
* 🔹 Add **data quality checks and validations**
* 🔹 Design **Gold layer (fact & dimension models)**
* 🔹 Implement **SCD (Slowly Changing Dimensions)**
* 🔹 Automate pipeline execution
* 🔹 Add scheduling (SQL Agent / external tools)
* 🔹 Integrate with Power BI for reporting

---

## 📊 Example Use Cases

* Customer purchase behavior analysis
* Sales trend analysis
* Product performance insights
* Revenue and KPI reporting

---

## 🛠️ Tech Stack

* SQL Server
* T-SQL (Stored Procedures, Bulk Insert)
* Data Warehousing Concepts
* Medallion Architecture
* CSV Data Sources
* (Planned) ETL/ELT Automation

---

## 💡 Key Concepts Demonstrated

* Data Warehousing Design
* Medallion Architecture
* Idempotent SQL Scripts
* Dynamic Object Handling (`SCHEMA_ID`, `OBJECT_ID`)
* Bulk Data Loading
* Stored Procedure Design
* Pipeline Structuring
