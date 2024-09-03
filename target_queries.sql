-- DATA CLEANING

-- Checking for null values in the data
SELECT 
SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS 'customer_null_values',
SUM(CASE WHEN customer_unique_id IS NULL THEN 1 ELSE 0 END) AS 'customer_unique_id_null_values',
SUM(CASE WHEN customer_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS 'customer_zip_code_prefix_null_values',	
SUM(CASE WHEN customer_city IS NULL THEN 1 ELSE 0 END) AS 'customer_city_null_values',	
SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS 'customer_state_null_values'
FROM customers; -- No null values

SELECT 
SUM(CASE WHEN geolocation_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS 'geolocation_zip_code_prefix_null_values',
SUM(CASE WHEN geolocation_lat IS NULL THEN 1 ELSE 0 END) AS 'geolocation_lat_null_values',
SUM(CASE WHEN geolocation_lng IS NULL THEN 1 ELSE 0 END) AS 'geolocation_lng_null_values',	
SUM(CASE WHEN geolocation_city IS NULL THEN 1 ELSE 0 END) AS 'geolocation_city_null_values',	
SUM(CASE WHEN geolocation_state IS NULL THEN 1 ELSE 0 END) AS 'geolocation_state_null_values'
FROM geolocation; -- NO null values

SELECT 
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS 'order_id_null_values',
SUM(CASE WHEN order_item_id IS NULL THEN 1 ELSE 0 END) AS 'order_item_id_null_values',
SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS 'product_id_null_values',	
SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS 'seller_id_null_values',
SUM(CASE WHEN shipping_limit_date IS NULL THEN 1 ELSE 0 END) AS 'shipping_limit_date_null_values',		
SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS 'price_null_values',
SUM(CASE WHEN freight_value IS NULL THEN 1 ELSE 0 END) AS 'freight_value_null_values'
FROM order_item;  -- no null values

SELECT 
SUM(CASE WHEN review_id IS NULL THEN 1 ELSE 0 END) AS 'review_id_null_values',
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS 'order_id_null_values',
SUM(CASE WHEN review_score IS NULL THEN 1 ELSE 0 END) AS 'review_score_null_values',	
SUM(CASE WHEN review_comment_title IS NULL THEN 1 ELSE 0 END) AS 'review_comment_title_null_values',
SUM(CASE WHEN review_creation_date IS NULL THEN 1 ELSE 0 END) AS 'review_creation_date_null_values',		
SUM(CASE WHEN review_answer_timestamp IS NULL THEN 1 ELSE 0 END) AS 'review_answer_timestamp_null_values'
FROM order_reviews;  -- reviews_comment_title has 87677 null values
						
SELECT 
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS 'order_id_null_values',
SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS 'customer_id_null_values',
SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS 'order_status_null_values',	
SUM(CASE WHEN order_purchase_timestamp IS NULL THEN 1 ELSE 0 END) AS 'order_purchase_timestamp_null_values',
SUM(CASE WHEN order_approved_at IS NULL THEN 1 ELSE 0 END) AS 'order_approved_at_null_values',		
SUM(CASE WHEN order_delivered_carrier_date IS NULL THEN 1 ELSE 0 END) AS 'order_delivered_carrier_date_null_values',
SUM(CASE WHEN order_delivered_customer_date IS NULL THEN 1 ELSE 0 END) AS 'order_delivered_customer_date_null_values',
SUM(CASE WHEN order_estimated_delivery_date IS NULL THEN 1 ELSE 0 END) AS 'order_estimated_delivery_date_null_values'
FROM orders;  -- order_delivered_carrier_date and order_delivered_customer_date has 1159 and 1943 null values repectively
					
SELECT 
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS 'order_id_null_values',
SUM(CASE WHEN payment_sequential IS NULL THEN 1 ELSE 0 END) AS 'payment_sequential_null_values',
SUM(CASE WHEN payment_type IS NULL THEN 1 ELSE 0 END) AS 'payment_type_null_values',	
SUM(CASE WHEN payment_value IS NULL THEN 1 ELSE 0 END) AS 'payment_value_null_values'
FROM payment;

SELECT 
SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS 'product_id_null_values',
SUM(CASE WHEN product_category IS NULL THEN 1 ELSE 0 END) AS 'product_category_null_values',
SUM(CASE WHEN product_name_length IS NULL THEN 1 ELSE 0 END) AS 'product_name_length_null_values',	
SUM(CASE WHEN product_description_length IS NULL THEN 1 ELSE 0 END) AS 'product_description_length_null_values',
SUM(CASE WHEN product_photos_qty IS NULL THEN 1 ELSE 0 END) AS 'product_photos_qty_null_values',
SUM(CASE WHEN product_weight_g IS NULL THEN 1 ELSE 0 END) AS 'product_weight_g_null_values',
SUM(CASE WHEN product_length_cm IS NULL THEN 1 ELSE 0 END) AS 'product_length_cm_null_values',
SUM(CASE WHEN product_height_cm IS NULL THEN 1 ELSE 0 END) AS 'product_height_cm_null_values',
SUM(CASE WHEN product_width_cm IS NULL THEN 1 ELSE 0 END) AS 'product_width_cm_null_values'
FROM products; -- has 1411,610,610,610 in product_cateory, product_name_lenth, product_description_length and product_photo_qty null values
				
SELECT 
SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS 'seller_id_null_values',
SUM(CASE WHEN seller_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS 'seller_zip_code_prefix_null_values',
SUM(CASE WHEN seller_city IS NULL THEN 1 ELSE 0 END) AS 'seller_city_null_values',	
SUM(CASE WHEN seller_state IS NULL THEN 1 ELSE 0 END) AS 'seller_state_null_values'
FROM sellers; -- No null values

-- Before modifing we create a backup tables because changing the original ones are not a good practice
-- creating duplicated table for orders because we need to change the datatype and handling other values too.
CREATE TABLE `orders_dup` (
  `order_id` text,
  `customer_id` text,
  `order_status` varchar(50) DEFAULT NULL,
  `order_purchase_timestamp` text,
  `order_approved_at` text,
  `order_delivered_carrier_date` text,
  `order_delivered_customer_date` text,
  `order_estimated_delivery_date` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO orders_dup SELECT * FROM orders;

-- creating duplicated table for order_item because we need to change the datatype and handling other values too.
CREATE TABLE `order_item_dup` (
  `order_id` text,
  `order_item_id` int DEFAULT NULL,
  `product_id` text,
  `seller_id` text,
  `shipping_limit_date` text,
  `price` double DEFAULT NULL,
  `freight_value` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO order_item_dup SELECT * FROM order_item;

-- creating duplicated table for order_item because we need to change the datatype and handling other values too.
CREATE TABLE `products_dup` (
  `product_id` text,
  `product_category` varchar(250) DEFAULT NULL,
  `product_name_length` int DEFAULT NULL,
  `product_description_length` int DEFAULT NULL,
  `product_photos_qty` int DEFAULT NULL,
  `product_weight_g` int DEFAULT NULL,
  `product_length_cm` int DEFAULT NULL,
  `product_height_cm` int DEFAULT NULL,
  `product_width_cm` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO products_dup SELECT * FROM products;


-- Checking datatypes of the each columns and changing if needed
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers' ;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'geolocation' ;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'order_item' ;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'order_reviews' ;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'orders' ;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'payment' ;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'products' ;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sellers' ;


-- Changing data types 
-- shipping_limit_date from order_itmes table(text-datetime) and others also
ALTER TABLE orders_dup
MODIFY COLUMN order_purchase_timestamp DATETIME;
ALTER TABLE orders_dup
MODIFY COLUMN order_approved_at DATETIME;
ALTER TABLE orders_dup
MODIFY COLUMN order_delivered_carrier_date DATETIME;
ALTER TABLE orders_dup
MODIFY COLUMN order_delivered_customer_date DATETIME;
ALTER TABLE orders_dup
MODIFY COLUMN order_estimated_delivery_date DATETIME;
ALTER TABLE order_item_dup
MODIFY COLUMN shipping_limit_date DATETIME;

-- Checking for duplicate values in each tables
WITH customer_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id,customer_unique_id,customer_zip_code_prefix,customer_city, 
customer_state) AS rn
FROM customers)
SELECT * FROM customer_rn
WHERE rn > 1;    -- no duplicate rows

WITH geolocation_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY geolocation_zip_code_prefix,geolocation_lat,geolocation_lng, geolocation_city, geolocation_state) AS rn
FROM geolocation)
SELECT COUNT(*) FROM geolocation_rn
WHERE rn > 1;    -- around 279667 records are duplicated

WITH order_item_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,
freight_value) AS rn
FROM order_item)
SELECT * FROM order_item_rn
WHERE rn > 1;    -- No duplicated records

WITH order_reviews_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY review_id,order_id,review_score,review_comment_title,review_creation_date,review_answer_timestamp) AS rn
FROM order_reviews)
SELECT * FROM order_reviews_rn
WHERE rn > 1;  -- No dupliacted records

WITH orders_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY order_id ,customer_id ,order_status ,order_purchase_timestamp ,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date) AS rn
FROM orders)
SELECT * FROM orders_rn
WHERE rn > 1;  -- No duplicated records

WITH payment_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY order_id ,payment_sequential ,payment_type ,payment_installments ,payment_value) AS rn
FROM payment)
SELECT * FROM payment_rn
WHERE rn > 1;  -- No duplicated records

WITH products_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY product_id ,product_category ,product_name_length ,product_description_length ,product_photos_qty ,product_weight_g ,product_length_cm ,product_height_cm ,product_width_cm) AS rn
FROM products)
SELECT * FROM products_rn
WHERE rn > 1;  -- No duplicated records

WITH seller_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY seller_id ,seller_zip_code_prefix ,seller_city ,seller_state) AS rn
FROM sellers)
SELECT * FROM seller_rn
WHERE rn > 1;  -- No duplicated records



-- DATA EXPLORATION

-- Is there a growing trend in the no. of orders placed over the past years?
SELECT count(order_id) AS 'order_count',YEAR(order_purchase_timestamp) AS 'Year' 
FROM orders
GROUP BY Year;


-- Can we see some kind of monthly seasonality in terms of the no. of orders being placed?
SELECT EXTRACT(MONTH FROM order_purchase_timestamp) AS month, COUNT(*) AS order_count
FROM orders
GROUP BY month
ORDER BY month;

/* During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night)
Dawn: 00:00 - 06:00 hrs
Mornings: 07:00 - 12:00 hrs
Afternoon: 13:00 - 18:00 hrs
Night: 19:00 - 23:59 hrs */
-- adding a new column to orders_dup table because changing/updating orginal table was not a good practice
SELECT COUNT(order_id) AS 'order_count',
(CASE
	WHEN TIME(order_purchase_timestamp) BETWEEN '00:00:00' AND '06:00:00' THEN 'Dawn'
    WHEN TIME(order_purchase_timestamp) BETWEEN '07:00:00' AND '12:00:00' THEN 'Morning'
    WHEN TIME(order_purchase_timestamp) BETWEEN '13:00:00' AND '18:00:00' THEN 'Afternoon' 
    ELSE 'Night' END) AS time_of_day
FROM orders_dup
GROUP BY order_purchase_timestamp;

-- adding new column to the orders table 
ALTER TABLE orders_dup ADD COLUMN time_of_day VARCHAR(20);
-- For this to work turn off safe mode for update
-- Edit > Preferences > SQL Edito > scroll down and toggle safe mode
-- Reconnect to MySQL: Query > Reconnect to server
UPDATE orders_dup
SET time_of_day = (
	CASE
		WHEN TIME(order_purchase_timestamp) BETWEEN '00:00:00' AND '06:00:00' THEN 'Dawn'
		WHEN TIME(order_purchase_timestamp) BETWEEN '07:00:00' AND '12:00:00' THEN 'Morning'
		WHEN TIME(order_purchase_timestamp) BETWEEN '13:00:00' AND '18:00:00' THEN 'Afternoon' 
		ELSE 'Night' END
);

SELECT COUNT(order_id) AS 'order_count', time_of_day
FROM orders_dup
GROUP BY time_of_day
ORDER BY order_count DESC;
-- Percent-wise distribution of order_count
SELECT 
    time_of_day,
    COUNT(order_id) AS order_count,
    ROUND((COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM orders)), 2) AS order_percentage
FROM orders_dup
GROUP BY time_of_day
ORDER BY order_percentage DESC;


-- Get the month on month no. of orders placed in each state.
SELECT COUNT(order_id) AS 'order_count',MONTHNAME(order_purchase_timestamp) AS 'month',customer_state
FROM orders o
JOIN customers c
ON c.customer_id = o.customer_id
GROUP BY month,customer_state
ORDER BY month,customer_state;


-- How are the customers distributed across all the states?
SELECT count(distinct(customer_id)) AS 'customer_count',customer_state
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC;

SELECT count(distinct(customer_unique_id)) AS 'customer_count',customer_state
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC;

-- Get the % increase in the cost of orders from year 2017 to 2018 (include months between Jan to Aug only).
SELECT 
    ROUND(
        ((SUM(CASE WHEN YEAR(shipping_limit_date) = 2018 AND MONTH(shipping_limit_date) BETWEEN 1 AND 8 THEN shipping_limit_date ELSE 0 END) - 
          SUM(CASE WHEN YEAR(shipping_limit_date) = 2017 AND MONTH(shipping_limit_date) BETWEEN 1 AND 8 THEN shipping_limit_date ELSE 0 END)) 
         * 100.0 / 
         SUM(CASE WHEN YEAR(shipping_limit_date) = 2017 AND MONTH(shipping_limit_date) BETWEEN 1 AND 8 THEN shipping_limit_date ELSE 0 END)
        ), 2) AS percentage_increase
FROM 
    order_item;

-- Calculate the Total & Average value of order price for each state.
SELECT ROUND(AVG(oi.price),2) AS 'average_price',ROUND(SUM(oi.price),2) AS 'total_price',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_item oi
ON oi.order_id = o.order_id
GROUP BY customer_state;

-- Calculate the Total & Average value of order freight for each state.
SELECT ROUND(AVG(oi.freight_value),2) AS 'average_freight',ROUND(SUM(oi.freight_value),2) AS 'total_freight',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_item oi
ON oi.order_id = o.order_id
GROUP BY customer_state
ORDER BY customer_state;

/* Find the no. of days taken to deliver each order from the order’s purchase date as delivery time.
Also, calculate the difference (in days) between the estimated & actual delivery date of an order.
Do this in a single query.
You can calculate the delivery time and the difference between the estimated & actual delivery date using the given formula:
- time_to_deliver = order_delivered_customer_date - order_purchase_timestamp
- diff_estimated_delivery = order_delivered_customer_date - order_estimated_delivery_date*/
SELECT DATEDIFF(order_delivered_customer_date,order_purchase_timestamp) AS 'actual_delivery_time',
		DATEDIFF(order_delivered_customer_date,order_estimated_delivery_date) AS 'estimated_vs_actual_delivery'
FROM orders;

--  Find out the top 5 states with the highest & lowest average freight value.
SELECT AVG(freight_value) AS 'avg_freight',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_item oi
ON oi.order_id = o.order_id
GROUP BY customer_state
ORDER BY avg_freight DESC 
LIMIT 5;

SELECT AVG(freight_value) AS 'avg_freight',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_item oi
ON oi.order_id = o.order_id
GROUP BY customer_state
ORDER BY avg_freight ASC 
LIMIT 5;

-- Find out the top 5 states with the highest & lowest average delivery time.
SELECT AVG(DATEDIFF(o.order_delivered_customer_date,o.order_purchase_timestamp)) AS 'avg_delivery_time',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY customer_state
ORDER BY avg_delivery_time DESC
LIMIT 5;   -- highest time taken state

SELECT AVG(DATEDIFF(o.order_delivered_customer_date,o.order_purchase_timestamp)) AS 'avg_delivery_time',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY customer_state
ORDER BY avg_delivery_time 
LIMIT 5;  -- lowest time taken states

/*Find out the top 5 states where the order delivery is really fast as compared to the estimated date of delivery.
You can use the difference between the averages of actual & estimated delivery date to figure out how fast the delivery was for each state.*/
SELECT AVG(DATEDIFF(o.order_purchase_timestamp,o.order_estimated_delivery_date)) AS 'avg_delivery_date_diff',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY customer_state
ORDER BY avg_delivery_date_diff
LIMIT 5;

-- Find the month on month no. of orders placed using different payment types.
SELECT COUNT(o.order_id) AS 'order_count', MONTHNAME(o.order_purchase_timestamp) AS 'month', 
p.payment_type,YEAR(o.order_purchase_timestamp) AS 'year'
FROM orders o
JOIN payment p
ON o.order_id = p.order_id
GROUP BY payment_type,month,year
ORDER BY year,month,order_count DESC;


-- Find the no. of orders placed on the basis of the payment installments that have been paid.
SELECT COUNT(order_id) AS 'order_count', payment_installments
FROM payment
GROUP BY payment_installments
ORDER BY order_count DESC;


-- EXPORTING TABLES
-- Creating a new table among all the tables present in the database to create a final one table for analzing it into further analyzing tools
-- Taking only few columns from all the table whch will help us on analyzing the data 

