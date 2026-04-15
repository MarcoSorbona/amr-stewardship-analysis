# Data Dictionary: Co-amoxiclav Prescribing Data

## Dataset Overview

| Property             | Value                                      |
|----------------------|--------------------------------------------|
| **Source**           | OpenPrescribing.net (University of Oxford) |
| **BNF code**         | 0501013K0 (co-amoxiclav, chemical)         |
| **Geography**        | Sub-ICB Location (formerly CCG)            |
| **Time period**      | February 2021 – January 2026               |
| **Update frequency** | Monthly                                    |

## Variables

| Variable | Type | Description | Example |
|----|----|----|----|
| `date` | Date | Month of prescribing (first day of month) | 2024-01-01 |
| `organisation_code` | Character | Sub-ICB Location code (ONS) | "52R" |
| `organisation_name` | Character | Sub-ICB Location name | "NHS NOTTINGHAM AND NOTTINGHAMSHIRE" |
| `prescribing_items` | Integer | Number of prescription items | 10,978 |
| `prescribing_quantity` | Integer | Total quantity prescribed | 254,488 |
| `prescribing_cost` | Numeric | Total cost (£) | 21,925.42 |
| `year` | Integer | Calendar year | 2026 |
| `month` | Integer | Calendar month (1-12) | 1 |
| `cost_per_item` | Numeric | Average cost per prescription item (£) | 2.00 |

## Data Quality Report

| Check           | Result                       |
|-----------------|------------------------------|
| Missing values  | None                         |
| Duplicate rows  | None                         |
| Negative values | None                         |
| Date range      | 2021-02-01 to 2026-01-01     |
| Organisations   | 106 unique Sub-ICB Locations |

## Known Limitations

-   **Volume, not rates**: No population denominator (list size) available
-   **Primary care only**: Does not include hospital prescribing
-   **Aggregated data**: No patient-level details

## Curation Steps

1.  Standardised column names (`clean_names()`)
2.  Validated data types
3.  Added derived columns (`year`, `month`, `cost_per_item`)
4.  Verified no missing values or duplicates
5.  Saved in both RDS and CSV formats
