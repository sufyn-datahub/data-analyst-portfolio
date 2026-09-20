SELECT * FROM orders;

SELECT EXTRACt( YEAR FROM order_date) as year,
			SUM(sales) AS total_sales,
			SUM(profit) AS total_profit,
			COUNT(DISTINCT order_id) AS order_count
FROM orders
GROUP BY year
ORDER BY year;


-- Top 10 products by profit

SELECT product_name,
		SUM(profit) AS total_profit
FROM orders
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;


-- Regions where discounting is destroying profit

SELECT region,
		AVG(discount) AS avg_discount,
		SUM(profit) AS total_profit
FROM orders
GROUP BY region
ORDER BY avg_discount DESC;

-- Month over month sales trend

SELECT EXTRACT(MONTH FROM or)

