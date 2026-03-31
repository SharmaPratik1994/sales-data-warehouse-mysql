# 📊 Sales Data Warehouse \& ETL Pipeline (MySQL + Excel)

# 

# 🚀 Project Overview

# 

#### This project demonstrates the end-to-end development of a Sales Data Warehouse using a star schema design. Raw sales data from Excel is transformed into a structured, analysis-ready format using SQL-based ETL processes.

#### 

#### The goal is to convert unstructured transactional data into a scalable data model that supports efficient querying and business analytics.

# 

# 🧠 Business Problem

#### 

* #### Organizations often rely on raw Excel data for reporting, which leads to:

#### 

* #### Slow query performance

#### 

* #### Data inconsistencies

#### 

* #### Difficulty in generating insights

#### 

* #### This project solves these issues by building a structured data warehouse for faster and more reliable analytics.

# 

# 🏗️ Solution Architecture

#### 

#### Excel (Raw Data)

#### &#x20;     ↓

#### Staging Table (MySQL)

#### &#x20;     ↓

#### Data Cleaning \& Transformation

#### &#x20;     ↓

#### Dimension Tables (Customer, Product, Segment, Location)

#### &#x20;     ↓

#### Fact Table (Sales)

#### &#x20;     ↓

#### Analytics \& Reporting

# 

# ⭐ Data Model (Star Schema)

# 

#### Fact Table

#### 

#### fact\_sales → sales transactions (measures + foreign keys)

#### 

#### Dimension Tables

#### 

#### dim\_customer

#### 

#### dim\_product

#### 

#### dim\_segment

#### 

#### dim\_location

#### 

#### dim\_date (optional)

#### 

#### This structure improves query performance and simplifies analysis.

# 

# 🔧 ETL Pipeline

#### 

#### 1\. Data Extraction

#### 

#### Imported raw Excel data into a staging table (staging\_facts)

#### 

#### 2\. Data Transformation

#### 

#### Cleaned and standardized data (handled duplicates, nulls, formatting issues)

#### 

#### Mapped business keys to surrogate keys using SQL joins:

#### 

#### customer\_id → customer\_key

#### 

#### product\_id → product\_key

#### 

#### segment → segment\_key

#### 

#### city/state/postal\_code → location\_key

#### 

#### 3\. Data Loading

#### 

#### Loaded transformed data into fact and dimension tables

#### 

#### Used bulk loading (LOAD DATA INFILE) for performance optimization

# 

# 🧩 Key Features

# 

#### ✔ Star schema data modeling

#### 

#### ✔ Surrogate key implementation

#### 

#### ✔ Foreign key relationships for data integrity

#### 

#### ✔ Multi-column joins for location mapping

#### 

#### ✔ Data cleaning and validation

#### 

#### ✔ Optimized bulk data loading

# 

# 📌 Sample SQL (Mapping Example)

# 

#### INSERT INTO fact\_sales (...)

#### SELECT 

#### &#x20;   s.order\_id,

#### &#x20;   c.customer\_key,

#### &#x20;   p.product\_key,

#### &#x20;   sg.segment\_key,

#### &#x20;   l.location\_key,

#### &#x20;   s.sales

#### FROM staging\_facts s

#### JOIN dim\_customer c ON s.customer\_id = c.customer\_id

#### JOIN dim\_product p ON s.product\_id = p.product\_id

#### JOIN dim\_segment sg ON s.segment = sg.segment

#### JOIN dim\_location l 

#### &#x20;   ON s.city = l.city

#### &#x20;  AND s.state = l.state

#### &#x20;  AND s.postal\_code = l.postal\_code;

# 

# 📊 Example Use Cases

# 

* #### Sales performance analysis

#### 

* #### Customer segmentation

#### 

* #### Product category insights

#### 

* #### Regional sales trends

# 

# 🛠️ Tools \& Technologies

# 

* #### MySQL

#### 

* #### Excel

#### 

* #### SQL (Joins, ETL, Data Modeling)

# 

# 📈 Key Learnings

# 

* #### Designing scalable data warehouse architectures

#### 

* #### Implementing ETL pipelines using SQL

#### 

* #### Handling real-world data quality issues

#### 

* #### Optimizing data loading and query performance

# 

# 🚀 Future Enhancements

# 

#### Integration with Power BI dashboard

#### 

#### Automation of ETL pipeline

#### 

#### Advanced analytics (customer lifetime value, forecasting)

# 

# 👨‍💻 Author

# 

# Pratik Sharma

# Data Analytics | SQL | Data Modeling | ETL

# 

# ⭐ If you find this useful, feel free to star the repo!

