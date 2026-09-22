# Data-Analytics-Portfolio
Collection of SQL database scripts and Python assignments focused on data analysis
# 📊 Data Analytics & SQL Portfolio

Welcome to my data analytics portfolio! This repository showcases my practical skills in relational database management, advanced SQL querying, data manipulation, and spreadsheet modeling. 

---

## 🛠️ Tech Stack & Skills Demonstrated
* **Languages & Querying:** MySQL, Advanced SQL
* **Tools & Environments:** MS Excel / Google Sheets, Jupyter Notebooks, Git & GitHub
* **Core Concepts:** 
  * Relational Database Design & Multi-Table Joins (INNER, LEFT JOIN)
  * Subqueries, Aggregate Grouping (`GROUP BY`, `HAVING`), and Filtering (`UNION`)
  * Date-interval calculations, conditional statements (`IF`), and percentage-based financial transformations
  * Data modeling, lookup functions (`XLOOKUP`), and Pivot Tables

---

## 📁 Repository Contents

### 1. Corporate Sales & Employee Database Analysis (`KashafChoudhary _Assignment  ITSQL10 _JDTF11.sql`)
* **Overview:** A comprehensive SQL script analyzing retail operations, customer purchasing behaviors, and employee hierarchies.
* **Key Business Questions Solved:**
  * **Top Customers:** Extracted top 5 highest-value orders using multi-table joins and sorting.
  * **Pattern Matching:** Filtered customer segments using conditional logic without redundant `OR` statements.
  * **Financial Metrics:** Automated 18% GST calculations, formatted final billing amounts, and projected collection dates (`DATE_ADD`).
  * **Conditional Grouping:** Categorized customer spending into tiers (*Premium, Gold, Silver*) and evaluated loyalty status using aggregate functions.
  * **Organizational Hierarchy:** Mapped employee-manager reporting relationships using self-joins on the employee table.

### 2. Relational Schema Setup & Sample Architecture (`ASSIGNMENT KASHAF[Mavenmovies].sql`)
* **Overview:** Database creation and schema definition script.
* **Highlights:** Built relational tables featuring foreign key constraints, primary keys, indexing, and automated triggers to manage transactional data flows efficiently.

### 3. Financial Budget & Spreadsheet Modeling (`Lookup function & pivot table.xlsx`)
* **Overview:** Applied advanced spreadsheet functions (such as `XLOOKUP` and dynamic Pivot Tables) to build financial reporting models and business budget case studies.

---

## 🚀 How to Run the Scripts
1. Clone this repository or download the `.sql` files.
2. Open your preferred SQL environment (like MySQL Workbench).
3. Run the schema creation and data insertion scripts, followed by the individual analytical queries to view the generated outputs.
