# Antimicrobial Stewardship: Co-amoxiclav Prescribing in England

A data curation and analysis project investigating co-amoxiclav prescribing trends, regional variation, and links to C. difficile outbreaks.

[**View the Live Analysis →**](https://marcosorbona.github.io/amr-stewardship-analysis/amr_stewardship.html)

## Projects

### AMR Stewardship: Co-amoxiclav Prescribing in England

**Focus:** Antimicrobial stewardship, co-amoxiclav prescribing trends, C. difficile link\
**Skills:** Data curation, time series, regional analysis, interactive dashboards\
[View Analysis](https://marcoSorbona.github.io/amr-stewardship-analysis/amr_stewardship.html)\
[View Curation Report](https://marcoSorbona.github.io/amr-stewardship-analysis/curation_report.html)

------------------------------------------------------------------------

## 📁 Project Structure

amr-stewardship-analysis/

├── amr_stewardship.qmd \# Main analysis report

├── curation_report.qmd \# Data curation documentation

├── data_dictionary.md \# Variable descriptions

├── README.md \# This file

├── R/

│ ├── 01_curate_data.R \# Data curation pipeline

│ └── 00_setup.R \# Data download script

├── data/

│ ├── raw/

│ │ └── coamoxiclav_prescribing.csv

│ └── processed/

│ ├── coamox_data_curated.rds

│ ├── coamox_data_curated.csv

│ └── quality_report.rds

└── outputs/

├── figures/

└── tables/

------------------------------------------------------------------------

## 📊 Key Findings

| Finding | Detail |
|--------------------------------------|----------------------------------|
| **Prescribing volume stable** | 90,000–110,000 items/month (2021–2026) |
| **Cost spike (2022-2023)** | 500% price increase during Strep A outbreak |
| **Cost per item** | Dropped from £5.50 (2023) to £2.07 (2026) |
| **East Midlands share** | \~10.4% (below expected 11.1%) |
| **C. difficile link** | Prescribing volume does NOT explain outbreak signal |

------------------------------------------------------------------------

## 🛠️ Skills Demonstrated

| Skill | Evidence |
|------------------------------|------------------------------------------|
| **Data curation** | Reusable pipeline, quality checks, data dictionary, curation report |
| **API data acquisition** | OpenPrescribing CSV export |
| **Data validation** | Missing values, duplicates, range checks |
| **Time series analysis** | National trends, cost per item |
| **Regional analysis** | East Midlands vs national comparison |
| **Interactive visualisation** | `plotly`, `ggplot2` |
| **Reproducible reporting** | Quarto, RDS caching |

------------------------------------------------------------------------

## 📦 Data Source

| Property        | Value                                      |
|-----------------|--------------------------------------------|
| **Source**      | OpenPrescribing.net (University of Oxford) |
| **BNF code**    | 0501013K0 (co-amoxiclav, chemical)         |
| **Geography**   | Sub-ICB Locations (formerly CCGs)          |
| **Time period** | February 2021 – January 2026               |
| **Access**      | CSV export via browser                     |

------------------------------------------------------------------------

## 🔁 Reproducibility

1.  **Clone** this repository
2.  **Download** raw CSV from OpenPrescribing to `data/raw/`
3.  **Run** `R/01_curate_data.R` to create curated dataset
4.  **Render** `amr_stewardship.qmd` for analysis
5.  **Render** `curation_report.qmd` for documentation

\`\`\`r \# Example: render the analysis quarto::quarto_render("amr_stewardship.qmd")

------------------------------------------------------------------------

## 📬 Contact

**Marco Sorbona, PhD**\
[GitHub](https://github.com/MarcoSorbona)\
[LinkedIn](https://linkedin.com/in/marco-sorbona-phd)

------------------------------------------------------------------------

## 📚 References

1.  UK Health Security Agency. (2026). *Group A streptococcal infections: report on seasonal activity in England, 2025 to 2026*. GOV.UK.

2.  Chemist+Druggist. (2023). *Co-amoxiclav price surges amid Strep A outbreak*.

3.  Department of Health and Social Care. (2022-2023). *Supply notifications for co-amoxiclav*.

4.  British Generic Manufacturers Association. (2023). *Generic medicine supply challenges*.

5.  OpenPrescribing.net, Bennett Institute for Applied Data Science, University of Oxford.

6.  NHS England. (2024). *National Medicines Optimisation Opportunities 2024/25*.

------------------------------------------------------------------------

## 📄 License

**Code**: MIT © Marco Sorbona

**Data**: Open Government Licence v3.0 (OpenPrescribing, UKHSA, DHSC)
