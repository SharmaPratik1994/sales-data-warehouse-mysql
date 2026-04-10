CREATE TABLE facts (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    customer_key INT,
    product_key INT,
    segment_key INT,
    location_key INT,
    sales DECIMAL(15,2),
    quantity INT,
    discount DECIMAL(15,2),
    profit DECIMAL(15,2),

    PRIMARY KEY (order_id, product_key),

    FOREIGN KEY (customer_key) REFERENCES dim_customers(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (segment_key) REFERENCES dim_segments(segment_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key)
);

ALTER TABLE facts DROP PRIMARY KEY;