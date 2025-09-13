-- 1. Top 10 categories by units sold
SELECT 
    category,
    SUM(quantity) AS total_units
FROM walmart_clean
GROUP BY category
ORDER BY total_units DESC
LIMIT 10;

-- 2. Category performance by branch (units + profit margin)
SELECT
    branch,
    category,
    SUM(quantity) AS total_units,
    AVG(profit_margin) AS avg_margin
FROM walmart_clean
GROUP BY branch, category
ORDER BY branch, total_units DESC;

-- 3. Busiest times of day and days of week by branch
SELECT
    branch,
    DAYOFWEEK(date) AS day_of_week,
    CASE
        WHEN HOUR(time) < 12 THEN 'Morning'
        WHEN HOUR(time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS num_transactions,
    SUM(quantity) AS total_units
FROM walmart_clean
GROUP BY branch, day_of_week, shift
ORDER BY branch, day_of_week, shift;

-- 4. Ratings vs sales by category
SELECT
    category,
    AVG(rating) AS avg_rating,
    SUM(quantity) AS total_units
FROM walmart_clean
GROUP BY category
ORDER BY avg_rating DESC;

-- 5. Branch profitability (using avg margin × total units as proxy)
SELECT
    branch,
    SUM(quantity) AS total_units,
    AVG(profit_margin) AS avg_margin
FROM walmart_clean
GROUP BY branch
ORDER BY total_units DESC;

-- 6. Payment method usage and average basket size
SELECT
    payment_method,
    COUNT(*) AS num_transactions,
    AVG(quantity) AS avg_units_per_transaction
FROM walmart_clean
GROUP BY payment_method
ORDER BY num_transactions DESC;

-- 7. Underperforming categories (bottom quartile in units and rating)
WITH category_stats AS (
    SELECT
        category,
        SUM(quantity) AS total_units,
        AVG(rating) AS avg_rating
    FROM walmart_clean
    GROUP BY category
),
quantiles AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_units) AS units_q1,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY avg_rating) AS rating_q1
    FROM category_stats
)
SELECT
    cs.category,
    cs.total_units,
    cs.avg_rating
FROM category_stats cs, quantiles q
WHERE cs.total_units < q.units_q1
  AND cs.avg_rating < q.rating_q1
ORDER BY cs.total_units ASC;

-- 8. Monthly sales trend (by units)
SELECT
    MONTH(date) AS month,
    SUM(quantity) AS total_units
FROM walmart_clean
GROUP BY month
ORDER BY month;

-- 9. Average basket size per branch
SELECT
    branch,
    AVG(quantity) AS avg_units_per_transaction
FROM walmart_clean
GROUP BY branch
ORDER BY avg_units_per_transaction DESC;

-- 10. Year-over-year growth by branch (units)
WITH yearly_units AS (
    SELECT
        branch,
        YEAR(date) AS year,
        SUM(quantity) AS total_units
    FROM walmart_clean
    GROUP BY branch, year
)
SELECT
    current.branch,
    current.year,
    current.total_units,
    previous.total_units AS previous_year_units,
    ((current.total_units - previous.total_units) / previous.total_units) * 100 AS growth_pct
FROM yearly_units current
JOIN yearly_units previous 
    ON current.branch = previous.branch AND current.year = previous.year + 1
ORDER BY growth_pct DESC;
