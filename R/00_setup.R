# 00_setup.R
# Data acquisition script for the AMR Stewardship project

library(tidyverse)
library(jsonlite)

# 1. Define paths
raw_data_dir <- "data/raw/"
processed_data_dir <- "data/processed/"
bnf_json_file <- paste0(raw_data_dir, "coamoxiclav_bnf.json")
prescribing_csv_file <- paste0(raw_data_dir, "coamoxiclav_prescribing.csv")
final_rds_file <- paste0(processed_data_dir, "coamox_data.rds")

# 2. Create directories if they don't exist
dir.create(raw_data_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(processed_data_dir, recursive = TRUE, showWarnings = FALSE)

# --- 3. Load BNF Code Data ---
# Use the saved JSON file
if (file.exists(bnf_json_file)) {
  coamox_search <- fromJSON(bnf_json_file)
  print("BNF code data loaded successfully.")
  bnf_code <- coamox_search[coamox_search$type == "chemical", "id"]
  print(paste("Using BNF code:", bnf_code))
} else {
  stop("BNF JSON file not found. Please save it manually from the browser to: ", bnf_json_file)
}

# --- 4. Load Prescribing Data ---
# The CSV export is more reliable. Already manually downloaded this file.
if (file.exists(prescribing_csv_file)) {
  coamox_df <- read_csv(prescribing_csv_file, show_col_types = FALSE)
  print("Prescribing data loaded successfully.")
} else {
  stop("Prescribing CSV file not found. Please download it manually from the browser to: ", prescribing_csv_file)
}

# --- 5. Final Data Cleaning & Saving ---
coamox_clean <- coamox_df |> 
  mutate(
    year = lubridate::year(date),
    month = lubridate::month(date)
  )

# Save the clean, analysis-ready data
saveRDS(coamox_clean, final_rds_file)
print(paste("Analysis-ready data saved to:", final_rds_file))