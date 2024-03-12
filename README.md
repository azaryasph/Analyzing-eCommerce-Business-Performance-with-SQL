# <img src="https://yt3.googleusercontent.com/ytc/AIdro_n0EO16H6Cu5os9ZOOP1_BsmeruHYlmlOcToYvI=s900-c-k-c0x00ffffff-no-rj" width="30">Analyzing eCommerce Business Performance<img src="https://yt3.googleusercontent.com/ytc/AIdro_n0EO16H6Cu5os9ZOOP1_BsmeruHYlmlOcToYvI=s900-c-k-c0x00ffffff-no-rj" width="30">
<div style="text-align:center">
    <img src="https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width="500" height="300">
</div>
Photo by <a href="https://unsplash.com/@homajob?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Scott Graham</a> on <a href="https://unsplash.com/photos/person-holding-pencil-near-laptop-computer-5fNmWej4tAA?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
<br><br>

This project involves analyzing the performance of an eCommerce business using SQL queries. The analysis is based on various aspects such as revenue, order cancellations, product categories, and payment types.

## 📑 Table Structure
<div style="text-align:center">
    <img src="./assets/Data_Relationship.jpg" width="500" height="300">
</div>
The database consists of several tables including `customers`, `geolocation`, `order_items`, `order_payments`, `order_reviews`, `orders`, `product`, and `sellers`. Each table contains specific information related to the eCommerce business. For example, the `orders` table contains information about each order including the order status and purchase timestamp. 

## 🔍 Analysis

The analysis is divided into several parts:

1. **💰 Annual Revenue Analysis**: This involves creating a `revenues` table that contains information on the company's total revenue for each year. The revenue is calculated as the sum of the price and freight value of each order item for orders that have been delivered or shipped.

2. **❌ Cancelled Orders Analysis**: This involves creating a `canceled_orders` table that contains information on the total number of cancelled orders for each year.

3. **📦 Product Category Analysis**: This involves creating two tables: `highest_product_revenues` and `highest_canceled_product`. The `highest_product_revenues` table contains the names of product categories that generate the highest total revenue for each year. The `highest_canceled_product` table contains the names of product categories that have the highest number of cancelled orders for each year.

4. **💳 Payment Type Analysis**: This involves displaying the total usage of each payment type of all time, sorted from the most popular. It also involves displaying detailed information on the usage of each payment type for each year.

5. **👥 Customer Analysis**: This involves calculating the average annual monthly active customer, displaying the number of new customers each year, displaying the number of customers who made more than one purchase (repeat order) in each year, and displaying the average number of orders made by customers for each year.

## 🧑‍💻 How to Run

To run the SQL queries, you need to have a SQL database with the required tables and data. You can then execute the SQL queries in your SQL client.

## 🎯 Conclusion

This project provides valuable insights into the performance of an eCommerce business. It can help the business to understand their revenue, order cancellations, popular product categories, preferred payment types, and customer behavior.