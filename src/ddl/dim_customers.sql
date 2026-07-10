-- =====================================================================================
-- Title                : DDL & Seed - Customer Dimension Table
-- Bundle               : databricks-unified-bi-accelerator
-- Author               : elviejodiaz
-- Purpose/Description  : Creates the customer demographic lookup table and seeds it
--                        with mock enterprise accounts.
-- =====================================================================================

CREATE TABLE IF NOT EXISTS ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.dim_customers (
    customer_id STRING NOT NULL COMMENT 'Primary key of the customer',
    customer_name STRING NOT NULL,
    customer_segment STRING NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    -- Declare the informational Primary Key for Unity Catalog mapping
    CONSTRAINT customer_pk PRIMARY KEY(customer_id) RELY
)
USING DELTA
TBLPROPERTIES ('delta.enableChangeDataFeed' = 'true')
COMMENT 'Dimension table containing customer demographic data.';

-- Seed Statement for Mock Corporate Accounts
INSERT OVERWRITE ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.dim_customers VALUES
('CUST_001', 'Acme Corp', 'Enterprise', CURRENT_TIMESTAMP()),
('CUST_002', 'Globex Corporation', 'Enterprise', CURRENT_TIMESTAMP()),
('CUST_003', 'Initech', 'Mid-Market', CURRENT_TIMESTAMP()),
('CUST_004', 'Vandelay Industries', 'SMB', CURRENT_TIMESTAMP()),
('CUST_005', 'Umbrella Corp', 'Enterprise', CURRENT_TIMESTAMP());
