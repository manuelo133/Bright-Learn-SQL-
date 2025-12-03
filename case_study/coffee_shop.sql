------Exploratory data analysis-------------

SELECT*
FROM CASESTUDY_1.BRIGHT.BRIGHT_COFFEE_SHOP_ANALYSIS

-------------------------------
--I want to check my categorial columns
SELECT DISTINCT store_location
FROM CASESTUDY_1.BRIGHT.BRIGHT_COFFEE_SHOP_ANALYSIS;
---------------------------------------------

SELECT DISTINCT product_category
FROM CASESTUDY_1.BRIGHT.BRIGHT_COFFEE_SHOP_ANALYSIS;

--------------------------------------
SELECT MIN(TRANSACTION_DATE) AS first_operating_date
FROM CASESTUDY_1.BRIGHT.BRIGHT_COFFEE_SHOP_ANALYSIS;

SELECT MAX(TRANSACTION_DATE) AS last_operating_date
FROM CASESTUDY_1.BRIGHT.BRIGHT_COFFEE_SHOP_ANALYSIS;

---------------------------------
SELECT TRANSACTION_DATE, 
       DAYNAME (TRANSACTION_DATE) AS day_name, 
       CASE
       WHEN day_name IN ('Sun','Sat') THEN 'Weekend'
       ELSE 'Weekday'
       END AS day_classification, 
       MONTHNAME (TRANSACTION_DATE) AS month_name,
       
       TRANSACTION_TIME,
       CASE 
           WHEN TRANSACTION_TIME BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
           WHEN TRANSACTION_TIME BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
           WHEN TRANSACTION_TIME >= '17:00:00' THEN 'Evening'
    END AS TIME_CLASSIFICATION,

       HOUR(TRANSACTION_TIME) AS hour_of_day,

-----------categorical data---------
store_location, 
product_category,
product_detail, 
product_type,


----ID's
COUNT (DISTINCT transaction_id) AS number_of_sales,

-----Revenue Calculation
SUM(TRANSACTION_QTY*UNIT_PRICE) AS revenue,
       
FROM CASESTUDY_1.BRIGHT.BRIGHT_COFFEE_SHOP_ANALYSIS
GROUP BY ALL;
