-- =====================================================================================
-- Title                : DDL & Seed - Sales Transaction Fact Table
-- Bundle               : databricks-unified-bi-accelerator
-- Author               : elviejodiaz
-- Purpose/Description  : Creates central analytical transaction log holding core metrics,
--                        mapping keys, and transaction channel vectors.
-- =====================================================================================

CREATE TABLE IF NOT EXISTS ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.fact_sales (
    sale_id STRING NOT NULL,
    customer_id STRING NOT NULL COMMENT 'FK to dim_customers',
    product_id STRING NOT NULL COMMENT 'FK to dim_products',
    location_id STRING NOT NULL COMMENT 'FK to dim_locations',
    date_id INT NOT NULL COMMENT 'FK to dim_dates',
    sales_channel STRING NOT NULL COMMENT 'ONLINE or OFFLINE operational vectors',
    quantity INT NOT NULL,
    total_amount DOUBLE NOT NULL COMMENT 'Gross sales value calculated as unit_price * quantity'
)
USING DELTA
COMMENT 'Fact table storing granular financial commerce transactions.';

-- Seed Statement for Mock Transactions Mapped to Dimension Keys
-- Logic: Maps to created dates (Jan 2026), correct channel splits, and gross valuations
INSERT OVERWRITE ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.fact_sales VALUES
('TX_10001', 'CUST_001', 'PROD_001', 'LOC_001', 20260101, 'ONLINE',  29000, 14500000.00),
('TX_10002', 'CUST_002', 'PROD_003', 'LOC_002', 20260101, 'OFFLINE', 11500, 13800000.00),
('TX_10003', 'CUST_003', 'PROD_003', 'LOC_003', 20260102, 'ONLINE',  10166, 12200000.00),
('TX_10004', 'CUST_004', 'PROD_001', 'LOC_001', 20260103, 'ONLINE',  21000, 10500000.00),
('TX_10005', 'CUST_005', 'PROD_002', 'LOC_005', 20260104, 'OFFLINE', 35333, 10600000.00);
