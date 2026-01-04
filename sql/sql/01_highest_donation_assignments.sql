-- View: highest_donation_assignments
-- Purpose:
--   List the top five assignment + donor_type combinations by total donation amount.
-- Output:
--   assignment_name, region, rounded_total_donation_amount (2dp), donor_type
-- Sort:
--   rounded_total_donation_amount DESC

CREATE OR REPLACE VIEW highest_donation_assignments AS
SELECT
  a.assignment_name,
  a.region,
  ROUND(SUM(d.amount), 2) AS rounded_total_donation_amount,
  d2.donor_type
FROM assignments AS a
JOIN donations AS d
  ON a.assignment_id = d.assignment_id
JOIN donors AS d2
  ON d.donor_id = d2.donor_id
GROUP BY
  a.assignment_name,
  a.region,
  d2.donor_type
ORDER BY
  rounded_total_donation_amount DESC
LIMIT 5;
