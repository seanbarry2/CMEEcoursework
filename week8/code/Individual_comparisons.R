# Load required libraries
library(sf)
library(ggplot2)
library(dplyr)
library(rnaturalearth)
library(stringr)  # For capitalization

# Define the list of species with their paths
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

# Directory path
base_dir <- "../data/SHP_files"

# Initialize an empty list to store shapefiles
species_ranges <- list()

# Load and combine all shapefiles
for (i in 1:nrow(species)) {
  # Construct file path
  shp_file <- file.path(base_dir, species$latin_name[i], "data_0.shp")
  
  # Read the shapefile
  species_range <- st_read(shp_file, quiet = TRUE)
  
  # Add a column for species name
  species_range <- species_range %>%
    mutate(Species = species$common_name[i])
  
  # Store the shapefile in the list
  species_ranges[[i]] <- species_range
}

# Combine all shapefiles into a single object
all_species_ranges <- do.call(rbind, species_ranges)

# Separate the Goitered gazelle from other species
goitered_gazelle <- all_species_ranges %>% filter(Species == "Goitered gazelle")

# Ensure CRS consistency for the Goitered gazelle
goitered_gazelle <- st_transform(goitered_gazelle, crs = "EPSG:4326")  # WGS84

# Load world map
world_map <- rnaturalearth::ne_countries(scale = "small", returnclass = "sf")

# Loop through each species (excluding Goitered gazelle)
for (i in 1:nrow(species)) {
  # Skip Goitered gazelle
  if (species$common_name[i] == "Goitered gazelle") next
  
  # Filter the range for the current species
  current_species <- all_species_ranges %>% filter(Species == species$common_name[i])
  
  # Ensure CRS consistency for the current species
  current_species <- st_transform(current_species, crs = "EPSG:4326")
  
  # Capitalize all words in the common name for the title
  capitalized_name <- str_to_title(species$common_name[i])
  
  # Create the map
  comparison_map <- ggplot() +
    # Add world map
    geom_sf(data = world_map, fill = "lightgray", color = "black", size = 0.2) +
    
    # Add Goitered gazelle range in medium red
    geom_sf(data = goitered_gazelle, fill = "#CC0000", alpha = 0.6, color = NA) +
    
    # Add the current species range in medium blue
    geom_sf(data = current_species, fill = "#0000CC", alpha = 0.6, color = NA) +
    
    # Customize the map with zoomed-in coordinates
    coord_sf(xlim = c(40, 125), ylim = c(10, 55), expand = FALSE) +
    
    # Add title and theme adjustments
    ggtitle(paste("Goitered Gazelle Range vs", capitalized_name)) +
    theme_minimal() +
    theme(
      legend.position = "none",  # Remove legend for simplicity
      panel.grid = element_blank(),
      legend.title = element_text(size = 12),
      legend.text = element_text(size = 10)
    )
  
  # Display the map
  print(comparison_map)
  
  # Pause to allow viewing before moving to the next map
  readline(prompt = paste("Press [Enter] to view the next map: Goitered Gazelle vs", capitalized_name))
}
