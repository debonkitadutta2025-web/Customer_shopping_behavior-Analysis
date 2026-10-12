USE customer_shopping_analysis;
SELECT
    customer_id,
    purchase_amount_usd,
    CASE
        WHEN purchase_amount_usd < 40 THEN 'Low Value'
        WHEN purchase_amount_usd < 80 THEN 'Medium Value'
        ELSE 'High Value'
    END AS spending_segment
FROM cleaned_customer_shopping;
SELECT
    CASE
        WHEN purchase_amount_usd < 40 THEN 'Low Value'
        WHEN purchase_amount_usd < 80 THEN 'Medium Value'
        ELSE 'High Value'
    END AS spending_segment,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY spending_segment
ORDER BY total_sales DESC;
SELECT
    category,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales
FROM cleaned_customer_shopping
GROUP BY category
HAVING SUM(purchase_amount_usd) > 50000
ORDER BY total_sales DESC;
SELECT
    category,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales
FROM cleaned_customer_shopping
GROUP BY category
HAVING SUM(purchase_amount_usd) > 50000
ORDER BY total_sales DESC;
SELECT
    category,
    ROUND(AVG(purchase_amount_usd), 2) AS category_average
FROM cleaned_customer_shopping
GROUP BY category
HAVING AVG(purchase_amount_usd) >
       (
           SELECT AVG(purchase_amount_usd)
           FROM customer_shopping
       )
ORDER BY category_average DESC;
SELECT
    customer_id,
    previous_purchases
FROM cleaned_customer_shopping
WHERE previous_purchases >
      (
          SELECT AVG(previous_purchases)
          FROM customer_shopping
      )
ORDER BY previous_purchases DESC;
WITH category_sales AS (
    SELECT
        category,
        COUNT(*) AS total_purchases,
        SUM(purchase_amount_usd) AS total_sales,
        AVG(purchase_amount_usd) AS average_purchase
    FROM cleaned_customer_shopping
    GROUP BY category
)

SELECT
    category,
    total_purchases,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(average_purchase, 2) AS average_purchase
FROM category_sales
ORDER BY total_sales DESC;
SELECT
    category,
    SUM(purchase_amount_usd) AS category_sales,
    ROUND(
        SUM(purchase_amount_usd) * 100.0 /
        (SELECT SUM(purchase_amount_usd)
         FROM customer_shopping),
        2
    ) AS sales_percentage
FROM cleaned_customer_shopping
GROUP BY category
ORDER BY category_sales DESC;
SELECT
    item_purchased,
    SUM(purchase_amount_usd) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(purchase_amount_usd) DESC
    ) AS sales_rank
FROM cleaned_customer_shopping
GROUP BY item_purchased
ORDER BY sales_rank;
SELECT
    item_purchased,
    SUM(purchase_amount_usd) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(purchase_amount_usd) DESC
    ) AS sales_rank
FROM cleaned_customer_shopping
GROUP BY item_purchased
ORDER BY sales_rank;
SELECT
    category,
    SUM(purchase_amount_usd) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(purchase_amount_usd) DESC
    ) AS category_rank
FROM cleaned_customer_shopping
GROUP BY category
ORDER BY category_rank;
SELECT
    location,
    SUM(purchase_amount_usd) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(purchase_amount_usd) DESC
    ) AS location_rank
FROM cleaned_customer_shopping
GROUP BY location
ORDER BY location_rank;
SELECT
    customer_id,
    COUNT(*) AS number_of_purchases,
    SUM(purchase_amount_usd) AS total_spending,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY customer_id
ORDER BY total_spending DESC;
WITH customer_spending AS (
    SELECT
        customer_id,
        COUNT(*) AS number_of_purchases,
        SUM(purchase_amount_usd) AS total_spending,
        AVG(purchase_amount_usd) AS average_purchase
    FROM cleaned_customer_shopping
    GROUP BY customer_id
)

SELECT
    customer_id,
    number_of_purchases,
    ROUND(total_spending, 2) AS total_spending,
    ROUND(average_purchase, 2) AS average_purchase
FROM customer_spending
ORDER BY total_spending DESC
LIMIT 10;
SELECT
    customer_type,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(*) AS total_transactions,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY customer_type;
SELECT
    customer_type,
    COUNT(DISTINCT customer_id) AS customer_count,
    ROUND(
        COUNT(DISTINCT customer_id) * 100.0 /
        (SELECT COUNT(DISTINCT customer_id)
         FROM customer_shopping),
        2
    ) AS customer_percentage
FROM cleaned_customer_shopping
GROUP BY customer_type;
SELECT
    subscription_status,
    COUNT(DISTINCT customer_id) AS customer_count,
    ROUND(
        COUNT(DISTINCT customer_id) * 100.0 /
        (SELECT COUNT(DISTINCT customer_id)
         FROM customer_shopping),
        2
    ) AS customer_percentage
FROM cleaned_customer_shopping
GROUP BY subscription_status;
SELECT
    discount_applied,
    COUNT(*) AS transactions,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase,
    ROUND(SUM(purchase_amount_usd), 2) AS total_sales
FROM cleaned_customer_shopping
GROUP BY discount_applied;
SELECT
    promo_code_used,
    COUNT(*) AS transactions,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase,
    ROUND(SUM(purchase_amount_usd), 2) AS total_sales
FROM cleaned_customer_shopping
GROUP BY promo_code_used
ORDER BY total_sales DESC;
SELECT
    category,
    ROUND(AVG(review_rating), 2) AS average_rating
FROM cleaned_customer_shopping
GROUP BY category
ORDER BY average_rating DESC
LIMIT 1;
SELECT
    item_purchased,
    COUNT(*) AS purchase_count
FROM cleaned_customer_shopping
GROUP BY item_purchased
ORDER BY purchase_count DESC
LIMIT 1;
SELECT
    payment_method,
    COUNT(*) AS transaction_count
FROM cleaned_customer_shopping
GROUP BY payment_method
ORDER BY transaction_count DESC
LIMIT 1;
SELECT
    frequency_of_purchases,
    COUNT(*) AS customer_count
FROM cleaned_customer_shopping
GROUP BY frequency_of_purchases
ORDER BY customer_count DESC
LIMIT 1;
SELECT
    category,
    SUM(CASE WHEN season = 'Spring'
             THEN purchase_amount_usd ELSE 0 END) AS spring_sales,

    SUM(CASE WHEN season = 'Summer'
             THEN purchase_amount_usd ELSE 0 END) AS summer_sales,

    SUM(CASE WHEN season = 'Fall'
             THEN purchase_amount_usd ELSE 0 END) AS fall_sales,

    SUM(CASE WHEN season = 'Winter'
             THEN purchase_amount_usd ELSE 0 END) AS winter_sales

FROM cleaned_customer_shopping
GROUP BY category
ORDER BY category;
SELECT
    category,
    SUM(
        CASE
            WHEN subscription_status = 'Yes'
            THEN purchase_amount_usd
            ELSE 0
        END
    ) AS subscriber_sales,

    SUM(
        CASE
            WHEN subscription_status = 'No'
            THEN purchase_amount_usd
            ELSE 0
        END
    ) AS non_subscriber_sales

FROM cleaned_customer_shopping
GROUP BY category
ORDER BY category;
SELECT
    customer_id,
    age,
    previous_purchases,
    purchase_amount_usd,

    CASE
        WHEN previous_purchases >= 20
             AND purchase_amount_usd >= 80
            THEN 'High Value Repeat Customer'

        WHEN previous_purchases >= 20
            THEN 'Frequent Customer'

        WHEN purchase_amount_usd >= 80
            THEN 'High Value Buyer'

        ELSE 'Regular Customer'
    END AS customer_segment

FROM cleaned_customer_shopping;
SELECT
    CASE
        WHEN previous_purchases >= 20
             AND purchase_amount_usd >= 80
            THEN 'High Value Repeat Customer'

        WHEN previous_purchases >= 20
            THEN 'Frequent Customer'

        WHEN purchase_amount_usd >= 80
            THEN 'High Value Buyer'

        ELSE 'Regular Customer'
    END AS customer_segment,

    COUNT(*) AS transaction_count,
    ROUND(SUM(purchase_amount_usd), 2) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase

FROM cleaned_customer_shopping

GROUP BY customer_segment

ORDER BY total_sales DESC;
SELECT
    COUNT(*) AS total_transactions,

    COUNT(DISTINCT customer_id) AS unique_customers,

    ROUND(SUM(purchase_amount_usd), 2) AS total_sales,

    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase,

    ROUND(AVG(review_rating), 2) AS average_rating,

    ROUND(AVG(age), 2) AS average_age,

    SUM(CASE
        WHEN subscription_status = 'Yes'
        THEN 1 ELSE 0
    END) AS subscription_transactions,

    SUM(CASE
        WHEN discount_applied = 'Yes'
        THEN 1 ELSE 0
    END) AS discounted_transactions,

    SUM(CASE
        WHEN promo_code_used = 'Yes'
        THEN 1 ELSE 0
    END) AS promo_transactions

FROM cleaned_customer_shopping;
