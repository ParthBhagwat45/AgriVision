# AgriVision: Agricultural Analytics

An end to end analysis of Indian agriculture using Python, SQL, Tableau, and Power BI to explore crop production, yield, climate, and soil data, uncover key trends, and generate actionable insights for data driven agricultural planning.

---

## Project Overview

This project simulates the role of a Data Analyst at **AgriVision**, a virtual agricultural organization dedicated to advancing sustainable and data driven agriculture across India. The objective is to transform agricultural data into meaningful insights that support informed decision making. By analyzing crop production, yield, rainfall, temperature, soil characteristics, and cultivation data, the project identifies trends, evaluates agricultural performance, and develops interactive dashboards that enable AgriVision to deliver actionable recommendations for farmers, policymakers, and agribusinesses.

---

## Tools & Technologies

- **Programming Languages:** Python, SQL (Google BigQuery)
- **Libraries:** Pandas, NumPy
- **Data Visualization:** Power BI, Tableau
- **Development Environment:** Jupyter Notebook

---

## Business Objective

The objective of this project was to:

- Analyze crop production and yield patterns across different states and crops.
- Examine the influence of rainfall, temperature, and soil characteristics on agricultural productivity.
- Identify high performing and underperforming crops and regions.
- Compare agricultural performance across states using interactive visualizations.
- Perform data cleaning, feature engineering, and exploratory data analysis to uncover meaningful trends.
- Develop interactive Tableau and Power BI dashboards for intuitive data exploration.
- Generate actionable insights and recommendations to support data driven agricultural planning.

---

## Dataset

The analysis is based on a comprehensive Indian agriculture dataset obtained from **Kaggle**, which consolidates data collected from multiple official government sources. The dataset covers various aspects of Indian agriculture, enabling analysis of crop production, climate, and cultivation patterns over time.

**Dataset Overview**
- **Source:** [Kaggle – Agriculture Crop Production in India Dataset](https://www.kaggle.com/datasets/asishpandey/crop-production-in-india)
- **Coverage:** 28 years of Indian agricultural data
- **Geographical Scope:** Multiple states across India
- **Data Domains:** Crop production, yield, cultivated area, rainfall, temperature, soil pH, crop type, season, and other agricultural indicators

---

## Project Workflow

### Ask
- Define the business objectives and key agricultural questions to be addressed.

### Prepare
- Collect the agricultural dataset from Kaggle.
- Review the dataset structure, variables, and data quality.

### Process
- Clean and preprocess the dataset using Python.
- Handle missing values and validate data quality.
- Create new features, including Soil Type, Rainfall Level, and Temperature Level.

### Analyze
- Perform Exploratory Data Analysis (EDA).
- Analyze crop production, yield, rainfall, temperature, and soil characteristics.
- Use SQL (Google BigQuery) to answer analytical business questions.

### Share
- Develop interactive dashboards in Tableau and Power BI to visualize key insights.

### Act
- Provide data-driven insights and recommendations to support agricultural planning and decision-making.

---

## Dashboard Overview

The project includes **four interactive dashboards** developed using **Tableau** and **Power BI**, providing comprehensive insights into Indian agriculture across the following areas:

- **Executive Overview:** Key performance indicators, crop production, cultivated area, yield, and state-wise performance.
- **Climate Analysis:** Rainfall, temperature, seasonal patterns, and their impact on agricultural productivity.
- **Crop Analysis:** Crop-wise production, yield comparison, cultivation trends, and regional distribution.
- **Soil Analysis:** Soil pH, soil type classification, and their relationship with crop performance.

---

## Repository Structure

```text
AgriVision/
│
├── README.md
│
├── data/
│   ├── AgriVision_Data_Raw.xlsx
│   └── AgriVision_Data_Cleaned.xlsx
│
├── notebooks/
│   └── AgriVision_Analysis.ipynb
│
├── sql/
│   └── AgriVision_SQL_Analysis.sql
│
├── tableau/
│   └── AgriVision_Tableau.twbx
│
└── powerbi/
    └── AgriVision_PowerBI.pbix
```
---

## Repository Files

- **Original Dataset:** [AgriVision_Data_Raw.xlsx](data/AgriVision_Data_Raw.csv)
- **Cleaned Dataset:** [AgriVision_Data_Cleaned.xlsx](data/AgriVision_Data_Cleaned.xls)
- **Python Analysis:** [AgriVision_Analysis.ipynb](notebooks/AgriVision_Analysis.ipynb)
- **SQL Analysis:** [AgriVision_SQL_Analysis.sql](sql/AgriVision_SQL_Analysis.sql)
- **Tableau Dashboard:** [AgriVision_Tableau.twbx](tableau/AgriVision_Tableau.twbx)
- **Power BI Dashboard:** [AgriVision_PowerBI.pbix](powerbi/AgriVision_PowerBI.pbix)

---

## Note

For detailed analysis, visualizations, insights, and recommendations, please refer to the Jupyter Notebook, SQL analysis, Tableau workbook, and Power BI dashboard included in this repository.
