-- Table Customers
CREATE TABLE customers(
  customer_id VARCHAR,
  customer_unique_id VARCHAR,
  customer_zip_code_prefix VARCHAR,
  customer_city VARCHAR,
  customer_state VARCHAR
);

-- Table Geolocation
CREATE TABLE geolocation(
  geolocation_zip_code_prefix VARCHAR,
  geolocation_lat DOUBLE PRECISION,
  geolocation_lng DOUBLE PRECISION,
  geolocation_city VARCHAR,
  geolocation_state VARCHAR
);


-- Table Order Items
CREATE TABLE order_items(
  order_id VARCHAR,,
  order_item_id INT,
  product_id VARCHAR,
  seller_id VARCHAR ,
  shipping_limit_date DATE,
  price DOUBLE PRECISION,
  freight_value DOUBLE PRECISION
);

-- Table Order Payments
CREATE TABLE order_payments(
  order_id VARCHAR,
  payment_sequential INT,
  payment_type VARCHAR,
  payment_installments INT,
  payment_value DOUBLE PRECISION
);




-- Table Order Reviews
CREATE TABLE order_reviews(
  review_id VARCHAR,
  order_id VARCHAR,
  review_score INT,
  review_comment_title VARCHAR,
  review_comment_message VARCHAR,
  review_creation_date DATE,
  review_answer_timestamp DATE
);

-- Create Table Orders
CREATE TABLE orders(
  order_id VARCHAR,
  customer_id VARCHAR,
  order_status VARCHAR,
  order_purchase_timestamp DATE,
  order_approved_at DATE,
  order_deivered_carrier_date DATE,
  order_delivered_customer_date DATE,
  order_estimated_delivery_date DATE
);

-- Table Products
CREATE TABLE product(
  product_id VARCHAR,
  product_category_name VARCHAR,
  product_name_length INT,
  product_description_length INT,
  product_photos_qty INT,
  product_weight_g INT,
  product_length_cm INT,
  product_height_cm INT,
  product_width_cm INT
);

-- Table Sellers
CREATE TABLE sellers(
  seller_id VARCHAR,
  seller_zip_code_prefix VARCHAR,
  seller_city VARCHAR,
  seller_state VARCHAR
);

--  Customer’s table Primary Key
ALTER TABLE customers
ADD PRIMARY KEY(customer_id);

-- Remove duplicate on geolocation_zip_code_prefix column from geolocation table
DELETE FROM geolocation
WHERE ctid NOT IN (
    SELECT min(ctid)
    FROM geolocation
    GROUP BY geolocation_zip_code_prefix
);

-- Set Primary key for geolocation_zip_code_Prefix
ALTER TABLE geolocation
ADD PRIMARY KEY (geolocation_zip_code_prefix);

-- Set Primary key for product_id
ALTER TABLE product
ADD PRIMARY KEY (product_id);

-- Set Primary key for order_id
ALTER TABLE orders
ADD PRIMARY KEY (order_id);

-- Set Primary key for seller_id
ALTER TABLE seller
ADD PRIMARY KEY (seller_id);

-- Set Foreign Key order_reviews
ALTER TABLE order_reviews
ADD CONSTRAINT fk_order_reviews
FOREIGN KEY(order_id)
REFERENCES orders;

-- Set Foreign Key order_payments
ALTER TABLE order_payments
ADD CONSTRAINT fk_order_payments
FOREIGN KEY(order_id)
REFERENCES orders;


–- Set Foreign Key orders(customer_id)
ALTER TALBLE orders
ADD CONSTRAINT fk_orders
FOREIGN KEY(customer_id)
REFERENCES customers;

-- Set Foreign Key order_items(order_id)
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items
FOREIGN KEY(order_id)
REFERENCES orders;

-- Set Foreign Key order_items(product_id)
ALTER TABLE order_items
ADD CONSTRAINT fk_order_product
FOREIGN KEY(product_id)
REFERENCES product 

-- Set Foreign Key order_items(seller_id)
ALTER TABLE order_items
ADD CONSTRAINT fk_order_seller
FOREIGN KEY(seller_id)
REFERENCES sellers

-- Insert values on Primary key in order to set seller_zip_code_prefix as foreign key
INSERT INTO geolocation (geolocation_zip_code_prefix)
SELECT DISTINCT seller_zip_code_prefix
FROM sellers
WHERE seller_zip_code_prefix NOT IN(
	SELECT geolcation_zip_code_prefix
	FROM geolocation
);

-- Set seller_zip_code_prefix  as foreign key 
ALTER TABLE sellers
ADD CONSTRAINT fk_sellers
FOREIGN KEY(seller_zip_code_prefix)
REFERENCES geolocation;

-- To set customer_zip_code_prefix as foreign key, i have to insert values to geolocation
INSERT INTO geolocation (geolocation_zip_code_prefix)
SELECT DISTINCT customer_zip_code_prefix
FROM customers
WHERE customer_zip_code_prefix NOT IN(
	SELECT geolocation_zip_code_prefix
	FROM geolocation
);

-- Set customer_zip_code_prefix as Foreign Key
ALTER TABLE customers
ADD CONSTRAINT fk_customers_geo
FOREIGN KEY(customer_zip_code_prefix)
REFERENCES geolocation;

