SNOWFLAKE_LEARNING_DB.INFORMATION_SCHEMA------Exploratory data analysis-------------

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
           WHEN TRANSACTION_TIME BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning(6am-11am)'
           WHEN TRANSACTION_TIME BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon(12pm-4pm)'
           WHEN TRANSACTION_TIME >= '17:00:00' THEN 'Evening(5pm-closing time)'
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

CASE
    WHEN revenue = 0 THEN 'None Spender'
    WHEN revenue BETWEEN 1 AND 50 THEN 'Low Spender'
    WHEN revenue BETWEEN 51 AND 100 THEN 'Med Spender' 
    WHEN revenue >100 THEN 'High Spender'
END AS spend_bucket


FROM CASESTUDY_1.BRIGHT.BRIGHT_COFFEE_SHOP_ANALYSIS
GROUP BY ALL;
