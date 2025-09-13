# 🛒 Walmart\_Python-SQL\_Business\_Answers

Analyze Walmart's retail sales data end-to-end: from cleaning raw data using Python to answering business-critical questions using MySQL.
This project provides actionable insights into **product performance, sales volume trends, customer ratings, payment behavior, and branch efficiency**.

---

## 🧠 About the Project

This is a hands-on **SQL + Python** analytics project using real-world Walmart data.

* Data is cleaned and transformed using **Python (pandas)**
* Key fields like sales volume, customer behavior, and profitability margins are standardized
* Cleaned data is stored as `walmart_clean.csv`
* SQL queries (MySQL) explore **retail KPIs, customer trends**, and **branch performance**

---

## 🛠️ Technologies Used

* **Python (pandas)** – Data cleaning and preprocessing
* **MySQL** – SQL-based analytics and business intelligence
* **Jupyter Notebook** – For step-by-step Python execution
* **Kaggle Dataset** – [Walmart Sales Dataset](https://www.kaggle.com/datasets/najir0123/walmart-10k-sales-datasets)

---

## 📦 Installation & Setup

### 1. Clone the repository

```bash
git clone https://github.com/your-username/walmart-sales-analysis.git
cd walmart-sales-analysis
```

### 2. Install Python requirements

```bash
pip install pandas
```

### 3. Clean the dataset with Python

Run the provided Jupyter Notebook:

* `walmart_data_cleaning.ipynb`
  This notebook performs data cleaning steps — handling missing values, correcting types, removing duplicates — and exports a clean version of the dataset as `walmart_clean.csv`.

### 4. Load data into MySQL

Create the table schema in MySQL:

```sql
CREATE TABLE walmart_clean (
    invoice_id VARCHAR(20),
    branch VARCHAR(10),
    city VARCHAR(50),
    category VARCHAR(50),
    unit_price FLOAT,
    quantity INT,
    date DATE,
    time TIME,
    payment_method VARCHAR(20),
    rating FLOAT,
    profit_margin FLOAT
);
```

Then import the `walmart_clean.csv` file using MySQL Workbench or your preferred import tool.

---

## 📊 Business Questions Answered

This project answers real-world analytics questions relevant to Walmart and retail operations:

1. 📦 What are the **top-selling categories** by units sold?
2. 🏪 Which categories perform best at each branch?
3. 🕒 What are the **busiest times of day** and **days of the week**?
4. ⭐ Do higher-rated categories correlate with higher sales?
5. 💰 Which branches are most efficient in terms of sales volume and profit margin?
6. 💳 What are the most popular payment methods and average basket size?
7. ⚠️ Which categories are underperforming in both units and customer ratings?
8. 📆 What are the monthly sales trends (seasonality)?
9. 🧾 What is the average basket size per branch?
10. 🔁 How are unit sales changing year-over-year by branch?

---

## 📈 Sample Insights

* 🔝 **Food & Beverages** consistently leads in total units sold.
* 🕒 Sales **peak during evenings and weekends**, especially in Branch B.
* ⭐ Higher-rated categories tend to sell more units, showing a positive link between **customer satisfaction and demand**.
* 💳 **Ewallet** is the most preferred payment method across branches.
* ⚠️ **Fashion Accessories** shows both low units and low ratings — a clear candidate for product review or promotions.
* 📆 **Branch C** experienced a year-over-year **decline in unit sales**, highlighting areas needing operational focus.

---

## 📁 Project Structure

```
📦 walmart-sales-analysis/
├── walmart_data_cleaning.ipynb   # Python notebook for cleaning and exporting data
├── walmart_clean.csv             # Cleaned dataset exported from notebook
├── queries.sql                   # MySQL queries answering business questions
└── README.md                     # This documentation
```

---

## 🤝 Contributing

Contributions are welcome! Fork the repo, make your changes, and open a pull request.

