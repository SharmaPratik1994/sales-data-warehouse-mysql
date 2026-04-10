CREATE TABLE stagging_facts (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    customer_id VARCHAR(20),
    customer_name VARCHAR(50),
    product_id VARCHAR(30),
    product_name VARCHAR(100),
    segment VARCHAR(20),
    country VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    sales DECIMAL(15,2),
    quantity INT,
    discount DECIMAL(15,2),
    profit DECIMAL(15,2)
);

select * from stagging_facts;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/stagging.csv'
INTO TABLE stagging_facts
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;