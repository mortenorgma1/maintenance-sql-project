# Industrial Maintenance & Downtime Analysis (SQL)

## Objective
The goal of this project is to analyze industrial equipment maintenance data
to identify downtime drivers, evaluate preventive vs corrective maintenance,
and flag high-risk equipment using SQL.

This project simulates a real-world maintenance environment where data is
stored across multiple related tables and analyzed for operational insights.

---

## Dataset
This project uses a synthetic but realistic industrial dataset consisting of:

- **equipment**  
  Master data for industrial machines (type, name, installation date)

- **maintenance_logs**  
  Maintenance events including maintenance type and downtime duration

- **failures**  
  Failure events associated with equipment

The dataset is designed to reflect real operational scenarios such as
one-to-many relationships and inconsistent categorical values.

---

## Database Schema
- One-to-many relationship between equipment and maintenance events
- One-to-many relationship between equipment and failures
- Foreign keys used to enforce data integrity

---

## Tools Used
- PostgreSQL
- pgAdmin
- SQL

---

## Key Business Questions
- Which equipment has the highest total downtime?
- Does preventive maintenance reduce downtime compared to corrective maintenance?
- Which maintenance events exceed average downtime thresholds?
- Which machines should be classified as high risk?
- How does downtime accumulate over time per machine?

---

## SQL Techniques Demonstrated
- Table creation and relational design
- INNER JOINs across multiple tables
- Aggregations using COUNT, SUM, and AVG
- GROUP BY and HAVING for filtered summaries
- CASE statements for classification and risk flags
- Window functions (OVER, PARTITION BY) for:
  - Running totals
  - Rankings
  - Per-equipment averages
- Data normalization using LOWER() to handle inconsistent values

---

## Key Insights
- Corrective maintenance events caused significantly higher downtime than preventive maintenance.
- Certain equipment accounted for the majority of total downtime.
- High-risk maintenance events were successfully identified using CASE logic.
- Window functions enabled trend analysis without collapsing row-level detail.
- Data consistency issues (case-sensitive categories) were identified and handled at query level.

---

## Business Recommendations
- Increase preventive maintenance on equipment with high cumulative downtime.
- Monitor maintenance events that exceed average downtime thresholds.
- Use running downtime metrics to detect early signs of equipment degradation.
- Standardize maintenance type values at data entry to improve reporting accuracy.

---

## Project Structure
maintenance-sql-project/
├── schema.sql
├── sample_data.sql
├── analysis.sql
└── insights.md

---

## Notes
This project focuses on SQL-based analysis and decision-making rather than
visualization or external tooling. All insights are derived directly from SQL
queries, reflecting common analyst workflows in production environments.