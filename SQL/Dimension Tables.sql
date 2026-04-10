use practice;

CREATE TABLE dim_customers (
customer_key INT AUTO_INCREMENT PRIMARY KEY,
customer_id varchar(15),
customer_name varchar(30)
);
select * from dim_customers;
select * from dim_location;

CREATE TABLE dim_location (
location_key INT auto_increment primary key,
country varchar(15),
city varchar(20),
state varchar(15),
postal_code varchar(10),
region varchar(15)
);


describe dim_location;

CREATE TABLE dim_product (
product_key int auto_increment primary key,
product_id varchar(30) ,
product_name varchar(100),
sub_category varchar(20),
category varchar(20)
);

select * from dim_product;


CREATE TABLE dim_segments (
segment_key int auto_increment primary key ,
segments varchar(15)
);

INSERT INTO dim_segments (segments)
VALUES 
('Consumer'),
('Corporate'),
('Home Office');


select * from dim_segments;



drop table stagging_facts;
#mapping data 

