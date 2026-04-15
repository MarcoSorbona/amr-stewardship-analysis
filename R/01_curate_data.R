# 01_curate_data.R
# Data curation pipeline for OpenPrescribing co-amoxiclav data

library(tidyverse)
library(janitor)
library(assertr)

# 1. Load raw data
raw_data <- read_csv("data/raw/coamoxiclav_prescribing.csv")

# 2. Initial inspection
glimpse(raw_data)
summary(raw_data)

# 3. Data quality checks
quality_report <- list(
  missing_values = raw_data |> summarise(across(everything(), ~sum(is.na(.)))),
  duplicate_rows = sum(duplicated(raw_data)),
  negative_values = raw_data |> filter(items < 0 | actual_cost < 0) |> nrow(),
  date_range = range(raw_data$date)
)

# 4. Clean column names
clean_data <- raw_data |> 
  clean_names() |> 
  rename(
    organisation_code = row_id,
    organisation_name = row_name,
    prescribing_items = items,
    prescribing_quantity = quantity,
    prescribing_cost = actual_cost
  )

# 5. Data type validation
clean_data <- clean_data |> 
  mutate(
    date = as.Date(date),
    prescribing_cost = as.numeric(prescribing_cost)
  )

# 6. Add derived columns
clean_data <- clean_data |> 
  mutate(
    year = year(date),
    month = month(date),
    cost_per_item = prescribing_cost / prescribing_items
  )

# 7. Final validation
stopifnot(
  "Missing values remain" = sum(is.na(clean_data$prescribing_items)) == 0,
  "Negative costs" = all(clean_data$prescribing_cost >= 0, na.rm = TRUE)
)

# 8. Save curated data
saveRDS(clean_data, "data/processed/coamox_data_curated.rds")
write_csv(clean_data, "data/processed/coamox_data_curated.cvs")

# 9. Save quality report
saveRDS(quality_report, "data/processed/quality_report.rds")

print("Curation complete. Quality report saved.")