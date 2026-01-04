# GoodThought Donation Analytics (PostgreSQL)

GoodThought NGO focuses on education, healthcare, and sustainable development.  
This mini project explores how data-driven insights can support its humanitarian assignments using a PostgreSQL dataset (2010–2023).

## Dataset overview
- **assignments**: project details (name, start/end dates, budget, region, impact_score)
- **donations**: donation transactions linked to donors and assignments (amount, assignment_id, donor_id)
- **donors**: donor metadata (including donor_type)

## Deliverables (SQL Views)

### 1) highest_donation_assignments
**Goal:** List the top five assignments based on total value of donations, categorised by donor type.  
**Columns:** assignment_name, region, rounded_total_donation_amount (2dp), donor_type  
**Logic:** Aggregation + grouping by assignment and donor_type.

File: `sql/01_highest_donation_assignments.sql`

### 2) top_regional_impact_assignments
**Goal:** Identify the assignment with the highest impact_score in each region, ensuring each listed assignment has at least one donation.  
**Columns:** assignment_name, region, impact_score, num_total_donations  
**Logic:** "Top-1-per-group" pattern using `ROW_NUMBER()` window function.

File: `sql/02_top_regional_impact_assignments.sql`

## How to run
Execute the SQL files in order in a PostgreSQL environment:
1. `01_highest_donation_assignments.sql`
2. `02_top_regional_impact_assignments.sql`
