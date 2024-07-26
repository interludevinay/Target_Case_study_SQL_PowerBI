
# Target Brazil E-commerce Case Study

## Project Overview

### Project Context

Target is a globally renowned brand and a prominent retailer in the United States. Target makes itself a preferred shopping destination by offering outstanding value, inspiration, innovation, and an exceptional guest experience that no other retailer can deliver.

This particular business case focuses on the operations of Target in Brazil and provides insightful information about 100,000 orders placed between 2016 and 2018. The dataset offers a comprehensive view of various dimensions including order status, price, payment and freight performance, customer location, product attributes, and customer reviews.

By analyzing this extensive dataset, it becomes possible to gain valuable insights into Target's operations in Brazil. The information can shed light on various aspects of the business, such as order processing, pricing strategies, payment and shipping efficiency, customer demographics, product characteristics, and customer satisfaction levels.

## Problem Statement

Assuming you are a data analyst/scientist at Target, you have been assigned the task of analyzing the given dataset to extract valuable insights and provide actionable recommendations.

## Objectives

1. **Exploratory Data Analysis (EDA)**
   - Import the dataset and perform usual exploratory analysis steps.
   - Check the structure and characteristics of the dataset:
     - Data type of all columns in the "customers" table.
     - Time range between which the orders were placed.
     - Count the cities and states of customers who ordered during the given period.

2. **In-depth Exploration**
   - Analyze the trend in the number of orders placed over the past years.
   - Identify monthly seasonality in terms of the number of orders being placed.
   - Determine the time of day Brazilian customers mostly place their orders (Dawn, Morning, Afternoon, Night).

3. **Evolution of E-commerce Orders in Brazil**
   - Month-on-month number of orders placed in each state.
   - Distribution of customers across all the states.

4. **Impact on Economy**
   - Analyze the money movement by e-commerce by looking at order prices, freight, and other costs.
   - Calculate the percentage increase in the cost of orders from 2017 to 2018 (January to August only).
   - Calculate the total and average value of order price for each state.
   - Calculate the total and average value of order freight for each state.

5. **Sales, Freight, and Delivery Time Analysis**
   - Calculate the delivery time and the difference between the estimated and actual delivery date of an order.
   - Identify the top 5 states with the highest and lowest average freight value.
   - Identify the top 5 states with the highest and lowest average delivery time.
   - Identify the top 5 states where the order delivery is significantly faster compared to the estimated delivery date.

6. **Payment Analysis**
   - Month-on-month number of orders placed using different payment types.
   - Number of orders placed based on the payment installments.

## Tools and Technologies Used

- **SQL**: For data cleaning and extracting insights.
- **PowerBI**: For creating interactive dashboards to visualize the insights.

## Methodology

### 1. Data Import

- Import the dataset.
`Importing dataset through directly `

`or`

` if there is any issue while importing the files because it is a huge file as compared to some small files so, in order to do that I wrote a python script that will help you to create table manuallly just copy and paste the text that i'm attaching to this repository` ` named as txt file`


### 2. Data cleaning and Exploratory Analysis

- Check the structure and characteristics of the dataset.

`customers :`
```sql
SELECT * FROM target.customers;
```
`geolocation :`
```sql
SELECT * FROM target.geolocation;
```
`order_item :`
```sql
SELECT * FROM target.order_item;
```
`orders :`
```sql
SELECT * FROM target.orders;
```
`purchase :`
```sql
SELECT * FROM target.purchase;
```
`payment :`
```sql
SELECT * FROM target.payment;
```
`order_reviews :`
```sql
SELECT * FROM target.order_reviews;
```
`products :`
```sql
SELECT * FROM target.products;
```

`target is our database/schema name`

- Analyze data types of all columns.

```sql
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers' ;
```
```sql
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'geolocation' ;
```
```sql
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'order_item' ;
```
```sql
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'order_reviews' ;
```
```sql
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'orders' ;
```
```sql
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'payment' ;
```
```sql
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'products' ;
```
```sql
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sellers' ;
```
- Checking for null values.

```sql
SELECT 
SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS 'customer_null_values',
SUM(CASE WHEN customer_unique_id IS NULL THEN 1 ELSE 0 END) AS 'customer_unique_id_null_values',
SUM(CASE WHEN customer_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS 'customer_zip_code_prefix_null_values',	
SUM(CASE WHEN customer_city IS NULL THEN 1 ELSE 0 END) AS 'customer_city_null_values',	
SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS 'customer_state_null_values'
FROM customers; -- No null values
```
```sql
SELECT 
SUM(CASE WHEN geolocation_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS 'geolocation_zip_code_prefix_null_values',
SUM(CASE WHEN geolocation_lat IS NULL THEN 1 ELSE 0 END) AS 'geolocation_lat_null_values',
SUM(CASE WHEN geolocation_lng IS NULL THEN 1 ELSE 0 END) AS 'geolocation_lng_null_values',	
SUM(CASE WHEN geolocation_city IS NULL THEN 1 ELSE 0 END) AS 'geolocation_city_null_values',	
SUM(CASE WHEN geolocation_state IS NULL THEN 1 ELSE 0 END) AS 'geolocation_state_null_values'
FROM geolocation; -- NO null values
```
```sql
SELECT 
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS 'order_id_null_values',
SUM(CASE WHEN order_item_id IS NULL THEN 1 ELSE 0 END) AS 'order_item_id_null_values',
SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS 'product_id_null_values',	
SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS 'seller_id_null_values',
SUM(CASE WHEN shipping_limit_date IS NULL THEN 1 ELSE 0 END) AS 'shipping_limit_date_null_values',		
SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS 'price_null_values',
SUM(CASE WHEN freight_value IS NULL THEN 1 ELSE 0 END) AS 'freight_value_null_values'
FROM order_item;  -- No null values
```
```sql
SELECT 
SUM(CASE WHEN review_id IS NULL THEN 1 ELSE 0 END) AS 'review_id_null_values',
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS 'order_id_null_values',
SUM(CASE WHEN review_score IS NULL THEN 1 ELSE 0 END) AS 'review_score_null_values',	
SUM(CASE WHEN review_comment_title IS NULL THEN 1 ELSE 0 END) AS 'review_comment_title_null_values',
SUM(CASE WHEN review_creation_date IS NULL THEN 1 ELSE 0 END) AS 'review_creation_date_null_values',		
SUM(CASE WHEN review_answer_timestamp IS NULL THEN 1 ELSE 0 END) AS 'review_answer_timestamp_null_values'
FROM order_reviews;  -- reviews_comment_title has 87677 null values
```
```sql						
SELECT 
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS 'order_id_null_values',
SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS 'customer_id_null_values',
SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS 'order_status_null_values',	
SUM(CASE WHEN order_purchase_timestamp IS NULL THEN 1 ELSE 0 END) AS 'order_purchase_timestamp_null_values',
SUM(CASE WHEN order_approved_at IS NULL THEN 1 ELSE 0 END) AS 'order_approved_at_null_values',		
SUM(CASE WHEN order_delivered_carrier_date IS NULL THEN 1 ELSE 0 END) AS 'order_delivered_carrier_date_null_values',
SUM(CASE WHEN order_delivered_customer_date IS NULL THEN 1 ELSE 0 END) AS 'order_delivered_customer_date_null_values',
SUM(CASE WHEN order_estimated_delivery_date IS NULL THEN 1 ELSE 0 END) AS 'order_estimated_delivery_date_null_values'
FROM orders; -- order_delivered_carrier_date and order_delivered_customer_date has 1159 and 1943 null values repectively
```
```sql					
SELECT 
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS 'order_id_null_values',
SUM(CASE WHEN payment_sequential IS NULL THEN 1 ELSE 0 END) AS 'payment_sequential_null_values',
SUM(CASE WHEN payment_type IS NULL THEN 1 ELSE 0 END) AS 'payment_type_null_values',	
SUM(CASE WHEN payment_value IS NULL THEN 1 ELSE 0 END) AS 'payment_value_null_values'
FROM payment;  -- No null values
```
```sql
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
```
```sql				
SELECT 
SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS 'seller_id_null_values',
SUM(CASE WHEN seller_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS 'seller_zip_code_prefix_null_values',
SUM(CASE WHEN seller_city IS NULL THEN 1 ELSE 0 END) AS 'seller_city_null_values',	
SUM(CASE WHEN seller_state IS NULL THEN 1 ELSE 0 END) AS 'seller_state_null_values'
FROM sellers; -- No null values
```
- Checking duplicated values.
```sql
WITH customer_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id,customer_unique_id,customer_zip_code_prefix,customer_city, 
customer_state) AS rn
FROM customers)
SELECT * FROM customer_rn
WHERE rn > 1;    -- no duplicate rows
```
```sql
WITH geolocation_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY geolocation_zip_code_prefix,geolocation_lat,geolocation_lng, geolocation_city, geolocation_state) AS rn
FROM geolocation)
SELECT COUNT(*) FROM geolocation_rn
WHERE rn > 1;    -- around 279667 records are duplicated
```
```sql
WITH order_item_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,
freight_value) AS rn
FROM order_item)
SELECT * FROM order_item_rn
WHERE rn > 1;    -- No duplicated records
```
```sql
WITH order_reviews_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY review_id,order_id,review_score,review_comment_title,review_creation_date,review_answer_timestamp) AS rn
FROM order_reviews)
SELECT * FROM order_reviews_rn
WHERE rn > 1;  -- No dupliacted records
```
```sql
WITH orders_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY order_id ,customer_id ,order_status ,order_purchase_timestamp ,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date) AS rn
FROM orders)
SELECT * FROM orders_rn
WHERE rn > 1;  -- No duplicated records
```
```sql
WITH payment_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY order_id ,payment_sequential ,payment_type ,payment_installments ,payment_value) AS rn
FROM payment)
SELECT * FROM payment_rn
WHERE rn > 1;  -- No duplicated records
```
```sql
WITH products_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY product_id ,product_category ,product_name_length ,product_description_length ,product_photos_qty ,product_weight_g ,product_length_cm ,product_height_cm ,product_width_cm) AS rn
FROM products)
SELECT * FROM products_rn
WHERE rn > 1;  -- No duplicated records
```
```sql
WITH seller_rn AS(SELECT *,
ROW_NUMBER() OVER(PARTITION BY seller_id ,seller_zip_code_prefix ,seller_city ,seller_state) AS rn
FROM sellers)
SELECT * FROM seller_rn
WHERE rn > 1;  -- No duplicated records
``` 

### 2. In-depth Exploration

- Analyze order trends over the past years.
```sql
SELECT count(order_id) AS 'order_count',YEAR(order_purchase_timestamp) AS 'Year' 
FROM orders
GROUP BY Year;
```
![Screenshot 2024-07-26 211830](https://github.com/user-attachments/assets/d40e4a37-cadf-4213-9e34-58bfa801b9b2)

`orders placed was increasing day by day repective to years`

- Identify monthly seasonality.
```sql
SELECT EXTRACT(MONTH FROM order_purchase_timestamp) AS month, COUNT(*) AS order_count
FROM orders
GROUP BY month
ORDER BY month;
```
![Screenshot 2024-07-26 212328](https://github.com/user-attachments/assets/5da80c42-03e3-4381-b997-f69998250c64)

`oders are gradually increasing in the March, April, May, June, July, August months and in remaning years its just normalized`
- Determine the time of day for order placement.
`In order to find the time of day order placed trend we'll create a new column that indicate '00:00:00 - 06:00:00' means 'Dawn', '07:00:00 - 12:00:00' menas 'Morning', '13:00:00 - 18:00:00' means 'Afternoon' and rest is considered as 'Night'`

`So, for that first we created a new table which is duplicate/copy of original 'orders' table because doing chnages directly into real data is not a good practice for a Data Analyst`

`Creating copy`
```sql
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
```
`Now changing order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date and order_estimated_delivery_date to 'DATETIME' because some functions are not applicanle for 'TEXT' functions and changing the datatype into the duplicate column`
```sql
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
```

`Now the main query that will give us the time where Brazilian ordered most`
```sql
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
```
![Screenshot 2024-07-26 213459](https://github.com/user-attachments/assets/58944324-4b38-4f53-b4b4-d28548a275dc)

`Brazilian order most item at Night and at Afternoon`


### 3. Evolution of E-commerce Orders

- Analyze the month-on-month number of orders in each state.
```sql
SELECT COUNT(order_id) AS 'order_count',MONTHNAME(order_purchase_timestamp) AS 'month',customer_state
FROM orders o
JOIN customers c
ON c.customer_id = o.customer_id
GROUP BY month,customer_state
ORDER BY month,customer_state;
```

- Visualize customer distribution across states.
```sql
SELECT count(distinct(customer_id)) AS 'customer_count',customer_state
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC;
```
![Screenshot 2024-07-26 214300](https://github.com/user-attachments/assets/f4a8c6ab-956e-4ee1-942f-ff40a9c63d6b)

`SP has the highest customer among all the other states`

### 4. Economic Impact Analysis

- Calculate the percentage increase in order costs.
```sql
SELECT 
    ROUND(
        ((SUM(CASE WHEN YEAR(shipping_limit_date) = 2018 AND MONTH(shipping_limit_date) BETWEEN 1 AND 8 THEN shipping_limit_date ELSE 0 END) - 
          SUM(CASE WHEN YEAR(shipping_limit_date) = 2017 AND MONTH(shipping_limit_date) BETWEEN 1 AND 8 THEN shipping_limit_date ELSE 0 END)) 
         * 100.0 / 
         SUM(CASE WHEN YEAR(shipping_limit_date) = 2017 AND MONTH(shipping_limit_date) BETWEEN 1 AND 8 THEN shipping_limit_date ELSE 0 END)
        ), 2) AS percentage_increase
FROM 
    order_item;
```
![Screenshot 2024-07-26 214541](https://github.com/user-attachments/assets/fbac51b8-e383-4b8f-b81b-4771af5490cb)


- Calculate total and average order price and freight for each state.

```sql
SELECT ROUND(AVG(oi.price),2) AS 'average_price',ROUND(SUM(oi.price),2) AS 'total_price',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_item oi
ON oi.order_id = o.order_id
GROUP BY customer_state;
```
![Screenshot 2024-07-26 214713](https://github.com/user-attachments/assets/b6c1ef4a-f0ca-4d9f-9d93-25a886a76a61)

### 5. Sales, Freight, and Delivery Time Analysis

- Calculate delivery time and differences between estimated and actual delivery dates.
```sql
SELECT DATEDIFF(order_delivered_customer_date,order_purchase_timestamp) AS 'actual_delivery_time',
		DATEDIFF(order_delivered_customer_date,order_estimated_delivery_date) AS 'estimated_vs_actual_delivery'
FROM orders;
```
![Screenshot 2024-07-26 214857](https://github.com/user-attachments/assets/469e5928-2394-4c7e-90fb-00c99d0369a9)


- Find out the top 5 states with the highest & lowest average delivery time.
`Highest avg_delivery_time w.r.t state`

```sql
SELECT AVG(DATEDIFF(o.order_delivered_customer_date,o.order_purchase_timestamp)) AS 'avg_delivery_time',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY customer_state
ORDER BY avg_delivery_time DESC
LIMIT 5;   -- highest time taken state
```

![Screenshot 2024-07-26 215444](https://github.com/user-attachments/assets/22bc416c-c0b2-4e9a-8416-16b1bce88d13)

`Lowest avg_delivery_time w.r.t state`
```sql
SELECT AVG(DATEDIFF(o.order_delivered_customer_date,o.order_purchase_timestamp)) AS 'avg_delivery_time',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY customer_state
ORDER BY avg_delivery_time 
LIMIT 5;  -- lowest time taken states
```
![Screenshot 2024-07-26 215634](https://github.com/user-attachments/assets/351aebef-acbe-42f3-8b3c-96d197877893)

- Identify top states based on average freight value and delivery time.

`highest freight value of top 5 states`

```sql
SELECT AVG(freight_value) AS 'avg_freight',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_item oi
ON oi.order_id = o.order_id
GROUP BY customer_state
ORDER BY avg_freight DESC 
LIMIT 5;
```
![Screenshot 2024-07-26 215121](https://github.com/user-attachments/assets/eb6eb72a-f06b-4bc7-900e-52b9456f84f4)

`lowest freight value of bottom 5 states`

```sql
SELECT AVG(freight_value) AS 'avg_freight',c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_item oi
ON oi.order_id = o.order_id
GROUP BY customer_state
ORDER BY avg_freight ASC 
LIMIT 5;
```

![Screenshot 2024-07-26 215234](https://github.com/user-attachments/assets/ff9449b3-d61d-460d-ae0d-bde1886cddf0)

### 6. Payment Analysis

- Analyze the number of orders by payment types.
```sql
SELECT COUNT(o.order_id) AS 'order_count', MONTHNAME(o.order_purchase_timestamp) AS 'month', 
p.payment_type,YEAR(o.order_purchase_timestamp) AS 'year'
FROM orders o
JOIN payment p
ON o.order_id = p.order_id
GROUP BY payment_type,month,year
ORDER BY year,month,order_count DESC;
```

![Screenshot 2024-07-26 215937](https://github.com/user-attachments/assets/82dbd411-0739-4f3b-b40a-ca7c7ad92357)

- Analyze orders based on payment installments.

```sql
SELECT COUNT(order_id) AS 'order_count', payment_installments
FROM payment
GROUP BY payment_installments
ORDER BY order_count DESC;
```
![Screenshot 2024-07-26 220033](https://github.com/user-attachments/assets/3b01f624-c8ea-4deb-bc54-404314b4413b)


## PowerBI Dashboard
In this project, I created an interactive PowerBI dashboard to visualize the insights from the Target Brazil E-commerce dataset. The dashboard includes multiple charts and graphs to provide a comprehensive view of the data.

### Measures and Calculations

### 1. Bins for Installment Column

* Created bins for the installment column to categorize the orders 
based on the number of installments.

### 2. Estimated Delivery Days

* Created a column to calculate the estimated delivery days for each order using the transform feature in PowerBI.

### 3. Additional Columns

* Added columns for more in-depth analysis, including delivery time calculations and differences between actual and estimated delivery dates.

### 4. Dashboard Highlights

* Interactive Filters: Users can interact with the dashboard using filters to view data for specific time periods, states, or payment types.

### 5. Dynamic Visuals 
* The charts and graphs update dynamically based on user selections, providing real-time insights.

* Comprehensive Insights: The dashboard provides a holistic view of Target's operations in Brazil, from order trends to economic impact and payment analysis.

![Screenshot 2024-07-26 221057](https://github.com/user-attachments/assets/0d7be476-db28-41c5-b03b-dd17248e4cf8)


## Conclusion

This case study provided valuable insights into Target's operations in Brazil, highlighting areas of strength and opportunities for improvement. By leveraging data analysis and visualization tools, we can drive informed decision-making and enhance business strategies.

