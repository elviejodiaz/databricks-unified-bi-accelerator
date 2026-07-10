# 🏢 Unified Enterprise Lakehouse BI Accelerator

[![Databricks](https://shields.io)](https://databricks.com)
[![CI Pipeline](https://shields.io)](https://github.com)
[![Language](https://shields.io)](https://apache.org)
[![Applied AI](https://shields.io)](https://databricks.com)

An enterprise-grade, Infrastructure-as-Code (IaC) architectural blueprint designed to completely eliminate decentralized Business Intelligence reporting silos and structural data duplication. This framework establishes a unified, high-performance Star Schema semantic layer natively within **Azure Databricks Unity Catalog**, serving declarative **Lakeview Dashboards** and orchestrating autonomous text-to-SQL conversational business analytics through **Genie AI Spaces**.

---

## 📌 Project Context & Real-World Business Problem

In traditional corporate reporting environments, engineering and business teams often construct independent, isolated data models. These metrics are frequently duplicated directly inside fragmented BI reporting tools (e.g., individual Power BI desktop datasets), creating a messy web of reporting silos. 

### The Cost of reporting Silos:
* **Severe Data Duplicity:** Identical data columns are processed and stored multiple times across separate workspaces, dramatically increasing cloud infrastructure storage and compute costs.
* **Governed Verification Deficit:** Divergent business definitions (such as calculating net profit margin via conflicting methods) result in multiple versions of the truth, breaking organizational trust.
* **Engineering Bottlenecks:** Business stakeholders remain locked behind traditional development ticketing queues just to ask simple, ad-hoc modifications on operational numbers.

### The Solution:
This project serves as a comprehensive **Solution Accelerator Pilot** to transition these silos into a centralized **Lakehouse Single Source of Truth (SSOT)**. By pushing the semantic and logic layers entirely upstream into Unity Catalog, any consumer engine—whether it's native interactive dashboards, self-service GenAI models, or external hybrid fabrics—shares an identical, centralized data canvas.

---

## 🏗️ Target Data Platform Architecture

The diagram below details the end-to-end framework. Azure Data Factory handles global scheduling, while all relational parameters, code compilations, asset tracking, and access controls remain strictly native to the **Databricks Ecosystem**.

```text
       [ Azure Data Factory / Global Orchestration ]
                             │
                             ▼
         [ Azure Databricks Unity Catalog Governance ]
                             │
      ┌──────────────────────┴──────────────────────┐
      │  Silver Layer: Star Schema Semantic Model   │
      │  (1 Fact Table ─── Maps ─── 4 Dimensions)   │
      │  Enforced via Informational Constraints     │
      └──────────────────────┬──────────────────────┘
                             │
        (Automated Databricks Asset Bundles CI/CD)
                             │
      ┌──────────────────────┴──────────────────────┐
      ▼                                             ▼
[ Native Lakeview Dashboard Canvas ]         [ AI-Powered Genie Space ]
  - Declarative Grid Layout                   - Contextual Semantic Parsing
  - Multi-Field Interactive Filters           - Guardrailed Text-to-SQL
  - Visual Financial Aggregations             - Conversational Analytics
```

---

## 📁 Repository Blueprint Structure

This repository follows professional, declarative Infrastructure-as-Code (IaC) packaging conventions. Dashboards and assets are kept completely self-contained within deployment paths to facilitate seamless environment promotion.

```text
├── .databricks/
│   └── bundle/
│       ├── databricks.yml              # Global bundle targets and environment variables
│       └── resources/
│           ├── sales_dashboard.yml     # Resource wrapper declaring dashboard assets
│           └── sales_performance.lvdash.json # Declarative JSON layout grid mapping widgets
├── src/
│   ├── ddl/
│   │   ├── dim_customers.sql           # Customer Dimension Table & seed data statements
│   │   ├── dim_products.sql            # Product Inventory Master, costs, & seed statements
│   │   ├── dim_locations.sql           # Geolocation metrics & spatial plot coordinates
│   │   ├── dim_dates.sql               # Calendar time-intelligence tracking boundaries
│   │   └── fact_sales.sql              # Transaction Fact Table & Informational constraints
│   └── notebooks/
│       └── setup_genie_space.py        # Programmatic notebook provisioning Genie Spaces via REST API
├── .github/
│   └── workflows/
│       └── validate-bundle.yml         # Continuous Integration checking compilation on code push
└── README.md                           # Main engineering architectural overview
```

---

## 💻 Technical Implementation Highlights

### 1. Multi-Environment Infrastructure as Code (IaC)
The configuration inside `.databricks/bundle/databricks.yml` parameterizes environmental layers entirely. It uses string interpolation tokens (`${bundle.variables.x}`) to transition seamlessly from individual sandboxes to production clusters without hardcoding sensitive endpoints.
* **Dynamic Target Variable Compilations:** Controls target storage namespaces (`dev_catalog`, `qa_catalog`, `prod_catalog`) automatically using compilation targets.
* **Service Principal Enforcement:** Restricts elevated non-development environments exclusively to authorized Microsoft Enterprise client IDs.

### 2. Informational Integrity Constraints (Photon & AI Guidance)
Because parallel big-data clusters experience heavy write locks under strict transactional foreign key verification, this platform leverages Databricks' **Informational Constraints** framework (`NOT ENFORCED` with the `RELY` optimizer hint). 

This setup achieves two critical objectives:
1. **Photon Optimization:** The compute layout optimizer bypasses redundant table reads, processing complex join execution pathways significantly faster.
2. **GenAI Metadata Mapping:** It injects an explicitly defined, predictable relational data map directly into the Genie parsing core, eliminating hallucinations during conversational query resolutions.

```sql
-- Architectural Snippet from src/ddl/fact_sales.sql
ALTER TABLE fact_sales ADD CONSTRAINT sales_product_fk FOREIGN KEY (product_id) REFERENCES dim_products(product_id) NOT ENFORCED;
ALTER TABLE fact_sales ADD CONSTRAINT sales_date_fk FOREIGN KEY (date_id) REFERENCES dim_dates(date_id) NOT ENFORCED;
```

### 3. Guardrailed Text-to-SQL Prompt Engineering
The orchestration script within `src/notebooks/setup_genie_space.py` interacts programmatically with the **Databricks REST API v2.0** to initialize conversational environments. It applies precise logic annotations directly to database schemas, ensuring that AI-generated queries consistently conform to corporate accounting methods:

```python
# Contextual AI Instruction Payload
"annotations": [{
    "entity_type": "table",
    "entity_name": "fact_sales",
    "comment": "When calculating net revenue or profit margins, remember that net revenue is always derived as: gross sales minus (product unit cost multiplied by quantity sold)."
}]
```

---

## 📊 Live Workspace Rendering (Production Look & Feel)

Once the declarative bundle code is compiled and pushed to a target workspace environment via the Databricks CLI, the unified layout grid configures automatically. Below is the operational interface generated directly by the underlying `.lvdash.json` parameters:

![Databricks SQL Dashboard UI Rendered](https://githubusercontent.com)

### Core UI Component Matrix:
* **Interactive Global Filter Header:** Provides unified multi-field dropdown parameters (`Year`, `Month`, `Product Category`, `Region`, `Customer Name`) applying real-time, cross-widget filter cascades.
* **Dynamic Profit Metric Counters:** Calculates advanced business definitions (`Gross Sales`, `Net Revenue`, and `Blended Margin %`) on the fly from the centralized semantic SQL layer.
* **Geospatial Bubble Visualizer:** Maps spatial data directly using coordinates (`latitude` / `longitude`) inherited from the geographic dimension lookups.
* **Channel Split Time-Series Chart:** Breaks down corporate performance by isolating Online vs Retail metrics side-by-side using advanced conditional `CASE WHEN` aggregation variables.

---

## 🔮 Production Optimizations & Roadmap Focus

To ensure this framework reflects leading architectural patterns, future iterations will implement the following advanced lakehouse enhancements:

1. **Zero-Copy Ingestion via Delta Sharing:** Instead of moving physical data packets out of Databricks when working with hybrid external analytics endpoints, use safe **Delta Sharing protocols** to build virtual shortcuts. This enables sub-second query processing completely free of secondary data replication risks.
2. **Verified Query Guardrails (Genie Trusted Assets):** To enforce bulletproof precision across financial metrics, specify explicit **Trusted Assets** within the Genie AI module. This locks complex parameters (e.g., Year-over-Year calculations) into audited, hardcoded code templates written by data engineers, instead of allowing the LLM to write the query on the fly.
