## Overview

This analysis explores industrial equipment maintenance and downtime data to
identify high-risk machines, compare preventive versus corrective maintenance,
and detect abnormal maintenance events using SQL-based analysis.

## Key Findings
- Corrective maintenance events resulted in significantly higher downtime compared to preventive maintenance.
- A small number of machines accounted for the majority of total downtime.
- Multiple maintenance events exceeded the average downtime for their respective machines.
- Running downtime analysis showed how downtime accumulates over time per machine.

## Business Interpretation
- Reactive maintenance appears to be a major driver of operational downtime.
- Repeated above-average downtime events may indicate early equipment degradation.
- Monitoring downtime trends over time can help identify risk before major failures occur.

## Recommendations
- Increase preventive maintenance for machines with high cumulative downtime.
- Flag maintenance events that exceed machine-specific average downtime thresholds.
- Use running downtime metrics as early warning indicators for maintenance planning.
- Standardize maintenance category values at data entry to improve data quality.
