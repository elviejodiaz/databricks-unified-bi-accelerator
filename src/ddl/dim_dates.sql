-- =====================================================================================
-- Title                : DDL & Seed - Date Dimension Table
-- Bundle               : databricks-unified-bi-accelerator
-- Author               : elviejodiaz
-- Purpose/Description  : Creates the time intelligence lookup table and populates it
--                        with calendar baseline references.
-- =====================================================================================

CREATE TABLE IF NOT EXISTS ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.dim_dates (
    date_id INT NOT NULL COMMENT 'Surrogate Key format YYYYMMDD',
    calendar_date DATE NOT NULL,
    calendar_year INT NOT NULL,
    calendar_month INT NOT NULL,
    calendar_quarter STRING NOT NULL,
    day_of_week STRING NOT NULL
)
USING DELTA
COMMENT 'Standard time intelligence dimension table.';

-- Seed Statement for Mock Calendar Baseline
INSERT OVERWRITE ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.dim_dates VALUES
(20260101, '2026-01-01', 2026, 1, 'Q1', 'Thursday'),
(20260102, '2026-01-02', 2026, 1, 'Q1', 'Friday'),
(20260103, '2026-01-03', 2026, 1, 'Q1', 'Saturday'),
(20260104, '2026-01-04', 2026, 1, 'Q1', 'Sunday'),
(20260105, '2026-01-05', 2026, 1, 'Q1', 'Monday');
