-- View: top_regional_impact_assignments
-- Purpose:
--   Identify the single highest-impact assignment in each region.
--   Ensures each returned assignment has received at least one donation.
-- Output:
--   assignment_name, region, impact_score, num_total_donations
-- Sort:
--   region ASC

CREATE OR REPLACE VIEW top_regional_impact_assignments AS
WITH base AS (
  SELECT
    a.assignment_name,
    a.region,
    a.impact_score,
    COUNT(*) AS num_total_donations
  FROM assignments AS a
  JOIN donations AS d
    ON a.assignment_id = d.assignment_id
  GROUP BY
    a.region,
    a.assignment_name,
    a.impact_score
),
ranked AS (
  SELECT
    assignment_name,
    region,
    impact_score,
    num_total_donations,
    ROW_NUMBER() OVER (
      PARTITION BY region
      ORDER BY impact_score DESC, num_total_donations DESC, assignment_name
    ) AS rn
  FROM base
)
SELECT
  assignment_name,
  region,
  impact_score,
  num_total_donations
FROM ranked
WHERE rn = 1
ORDER BY region ASC;
