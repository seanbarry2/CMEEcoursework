# Load necessary libraries
library(sf)        # For spatial operations
library(terra)     # For raster and vector data manipulation
library(dplyr)     # For data manipulation

# Define the list of species shapefiles
species <- data.frame(
  common_name = c(
    "Goitered gazelle", "Saiga antelope", "Mongolian gazelle", 
    "Himalayan tahr", "Chinkara", "Markhor", 
    "Urial", "Bharal", "Tibetan gazelle", "Chiru"
  ),
  latin_name = c(
    "gazella_subgutturosa", "saiga_tatarica", "procapra_gutturosa",
    "hemitragus_jemlahicus", "gazella_bennettii", "capra_falconeri",
    "ovis_vignei", "pseudois_nayaur", "procapra_picticaudata", "pantholops_hodgsonii"
  )
)

# Directory path to species shapefiles
base_dir <- "../data/SHP_files"

# Load Goitered Gazelle shapefile
goitered_gazelle_file <- file.path(base_dir, "gazella_subgutturosa", "data_0.shp")
goitered_gazelle <- st_read(goitered_gazelle_file, quiet = TRUE)

# Ensure CRS is consistent
goitered_gazelle <- st_transform(goitered_gazelle, crs = "EPSG:4326")

# Initialize a data frame to store results
overlap_results <- data.frame(
  Species = character(),
  Overlap_km2 = numeric(),
  Range_km2 = numeric(),
  Overlap_Percentage = numeric(),
  stringsAsFactors = FALSE
)

# Loop through each species
for (i in 1:nrow(species)) {
  # Skip Goitered Gazelle itself
  if (species$latin_name[i] == "gazella_subgutturosa") next
  
  # Load species shapefile
  shp_file <- file.path(base_dir, species$latin_name[i], "data_0.shp")
  species_range <- st_read(shp_file, quiet = TRUE)
  
  # Validate and correct geometries
  species_range <- st_make_valid(species_range)
  goitered_gazelle <- st_make_valid(goitered_gazelle)
  
  # Ensure CRS is consistent
  species_range <- st_transform(species_range, crs = st_crs(goitered_gazelle))
  
  # Calculate intersection between the species and Goitered Gazelle ranges
  intersection <- st_intersection(goitered_gazelle, species_range)
  
  # Calculate the area of overlap in km²
  if (nrow(intersection) > 0) {  # Check if intersection exists
    overlap_area <- sum(st_area(intersection)) / 1e6  # Convert m² to km²
  } else {
    overlap_area <- 0  # No overlap
  }
  
  # Calculate total range area of the species in km²
  species_area <- sum(st_area(species_range)) / 1e6  # Convert m² to km²
  
  # Convert areas to numeric values for consistent calculations
  overlap_area <- as.numeric(overlap_area)
  species_area <- as.numeric(species_area)
  
  # Calculate percentage overlap
  overlap_percentage <- ifelse(species_area > 0, (overlap_area / species_area) * 100, 0)
  
  # Append results
  overlap_results <- rbind(
    overlap_results,
    data.frame(
      Species = species$common_name[i],
      Overlap_km2 = round(overlap_area, 2),
      Range_km2 = round(species_area, 2),
      Overlap_Percentage = round(overlap_percentage, 2),
      stringsAsFactors = FALSE
    )
  )
}

# Write the results to a CSV file in the results directory
output_file <- "../results/overlap_percentage_with_goitered_gazelle.csv"
write.csv(overlap_results, output_file, row.names = FALSE)

# Print confirmation message
cat("Overlap results saved to:", output_file, "\n")
