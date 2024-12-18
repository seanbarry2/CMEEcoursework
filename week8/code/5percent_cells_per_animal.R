# Load necessary libraries
library(terra)
library(sf)
library(dplyr)

# Load the 2.5-minute resolution population density data (GeoTIFF)
pop_density <- rast("../data/population_density/gpw_v4_population_density_rev11_2020_2pt5_min.tif")

# Calculate the top 5% threshold
top_5_threshold <- quantile(values(pop_density), 0.95, na.rm = TRUE)

# Filter raster to include only values in the top 5%
high_density <- pop_density
values(high_density)[values(high_density) < top_5_threshold] <- NA  # Mask bottom 95% values

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

# Initialize a data frame to store results
results <- data.frame(
  Species = character(),
  Top5PercentDots = numeric(),
  stringsAsFactors = FALSE
)

# Loop through each species
for (i in 1:nrow(species)) {
  # Load species shapefile
  shp_file <- file.path(base_dir, species$latin_name[i], "data_0.shp")
  species_range <- st_read(shp_file, quiet = TRUE)
  
  # Ensure CRS consistency with population density raster
  species_range <- st_transform(species_range, crs = crs(pop_density))
  
  # Mask the top 5% population density raster to the species range
  masked_density <- mask(high_density, vect(species_range))
  
  # Count the number of cells (dots) in the top 5% for this species
  num_dots <- sum(!is.na(values(masked_density)))
  
  # Append the results to the data frame
  results <- rbind(
    results,
    data.frame(
      Species = species$common_name[i],
      Top5PercentDots = num_dots,
      stringsAsFactors = FALSE
    )
  )
}

# Write the results to a CSV file in the results directory
output_file <- "../results/top_5_percent_dots_by_species.csv"
write.csv(results, output_file, row.names = FALSE)

# Print confirmation message
cat("Results saved to:", output_file, "\n")
