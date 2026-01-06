-- Q1: View all maintenance records
SELECT * 
FROM maintenance_logs
ORDER BY maintenance_id;

-- Q2: Maintenance records with equipment names
SELECT
    e.equipment_name,
    m.maintenance_date,
    m.maintenance_type,
    m.downtime_hours
FROM maintenance_logs m
JOIN equipment e
    ON m.equipment_id = e.equipment_id;

-- Q3: Total downtime per equipment (corrective only)
SELECT
    e.equipment_name,
    SUM(m.downtime_hours) AS total_downtime
FROM maintenance_logs m
JOIN equipment e
    ON m.equipment_id = e.equipment_id
WHERE lower(m.maintenance_type) = 'corrective'
GROUP BY e.equipment_name
HAVING SUM(m.downtime_hours) >= 5;

-- Q4: Flag jobs above machine average downtime
SELECT
    e.equipment_name,
    m.maintenance_date,
    m.downtime_hours,
    ROUND(
        AVG(m.downtime_hours) OVER (PARTITION BY e.equipment_name),
        2
    ) AS avg_machine_downtime,
    CASE
        WHEN m.downtime_hours >
             AVG(m.downtime_hours) OVER (PARTITION BY e.equipment_name)
        THEN 'Above Average'
        ELSE 'Normal'
    END AS downtime_flag
FROM maintenance_logs m
JOIN equipment e
    ON m.equipment_id = e.equipment_id;

-- Q5: Running downtime per machine
SELECT
    e.equipment_name,
    m.maintenance_date,
    m.downtime_hours,
    SUM(m.downtime_hours) OVER (
        PARTITION BY e.equipment_name
        ORDER BY m.maintenance_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_downtime
FROM maintenance_logs m
JOIN equipment e
    ON m.equipment_id = e.equipment_id;
