-- =====================================================================================
-- Title                : DDL & Seed - Product Dimension Table
-- Bundle               : databricks-unified-bi-accelerator
-- Author               : elviejodiaz
-- Purpose/Description  : Defines product inventory categorization metrics alongside
--                        financial pricing and unit cost structures.
-- =====================================================================================

CREATE TABLE IF NOT EXISTS ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.dim_products (
    product_id STRING NOT NULL COMMENT 'Primary key of product',
    product_name STRING NOT NULL,
    product_category STRING NOT NULL,
    sku STRING NOT NULL,
    unit_price DOUBLE NOT NULL COMMENT 'Selling price point per unit',
    unit_cost DOUBLE NOT NULL COMMENT 'Base cost per unit'
)
USING DELTA
COMMENT 'Dimension table containing product definitions and core cost baselines.';

-- Seed Statement for Mock Financial Inventory
INSERT OVERWRITE ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.dim_products VALUES
('PROD_001', 'Enterprise Cloud Compute Suite', 'Electronics', 'SKU-E-001', 500.00, 150.00),
('PROD_002', 'Premium Office Workspace Station', 'Home Goods', 'SKU-H-002', 300.00, 120.00),
('PROD_003', 'Automated Predictive Pipeline Module', 'Software', 'SKU-S-003', 1200.00, 400.00),
('PROD_004', 'Corporate Branded Apparel Kit', 'Apparel', 'SKU-A-004', 50.00, 15.00),
('PROD_005', 'Industrial Sensor Node Hardware', 'Electronics', 'SKU-E-005', 150.00, 65.00);
