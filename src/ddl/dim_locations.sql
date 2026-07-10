-- =====================================================================================
-- Title                : DDL & Seed - Locations Dimension Table
-- Bundle               : databricks-unified-bi-accelerator
-- Author               : elviejodiaz
-- Purpose/Description  : Provisions geolocation lookups mapping regions to exact
--                        geospatial nodes for visual map rendering.
-- =====================================================================================

CREATE TABLE IF NOT EXISTS ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.dim_locations (
    location_id STRING NOT NULL COMMENT 'Primary key of geographic location',
    country STRING NOT NULL,
    region STRING NOT NULL COMMENT 'Regional territory breakdown',
    latitude DOUBLE NOT NULL COMMENT 'Geospatial coordinate node',
    longitude DOUBLE NOT NULL COMMENT 'Geospatial coordinate node',
    -- Informational Primary Key mapping for catalog relations
    CONSTRAINT location_pk PRIMARY KEY(location_id) RELY
)
USING DELTA
COMMENT 'Geographic location lookup parameters for map rendering and spatial groupings.';

-- Seed Statement for Mock Spatial Plotting Points
INSERT OVERWRITE ${bundle.variables.target_catalog}.${bundle.variables.target_schema}.dim_locations VALUES
('LOC_001', 'United States', 'North America', 37.0902, -95.7129),
('LOC_002', 'United Kingdom', 'Western Europe', 55.3781, -3.4360),
('LOC_003', 'Germany', 'Western Europe', 51.1657, 10.4515),
('LOC_004', 'Japan', 'East Asia', 36.2048, 138.2529),
('LOC_005', 'Brazil', 'South America', -14.2350, -51.9253);
