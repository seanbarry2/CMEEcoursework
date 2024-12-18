# Load necessary libraries
library(terra)
library(ggplot2)
library(sf)
library(rnaturalearth)

# Load the 2.5-minute resolution population density data (GeoTIFF)
pop_density <- rast("../data/population_density/gpw_v4_population_density_rev11_2020_2pt5_min.tif")

# Calculate the top 5% threshold
top_5_threshold <- quantile(values(pop_density), 0.95, na.rm = TRUE)

# Filter raster to include only values in the top 5%
high_density <- pop_density
values(high_density)[values(high_density) < top_5_threshold] <- NA  # Mask bottom 95% values

# Convert the high-density raster to a data frame
high_density_df <- as.data.frame(high_density, xy = TRUE, na.rm = TRUE)
colnames(high_density_df)[3] <- "population_density"

# Load landmass shapefile for visualizing land boundaries
world_map <- rnaturalearth::ne_countries(scale = "small", returnclass = "sf")

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

# Initialize an empty list to store species ranges
species_ranges <- list()

# Load all species shapefiles and combine them
for (i in 1:nrow(species)) {
  shp_file <- file.path(base_dir, species$latin_name[i], "data_0.shp")
  species_range <- st_read(shp_file, quiet = TRUE)
  species_ranges[[i]] <- species_range
}

# Combine all species ranges into a single layer
combined_species_ranges <- do.call(rbind, species_ranges)
combined_species_ranges <- st_union(combined_species_ranges)  # Dissolve into one geometry

# Ensure CRS consistency for combined species ranges
combined_species_ranges <- st_transform(combined_species_ranges, crs = st_crs(world_map))

# Plot the map with top 5% population density and combined species overlay
human_pop_species_map <- ggplot() +
  # Add white background for the ocean
  annotate("rect", xmin = -180, xmax = 180, ymin = -90, ymax = 90,
           fill = "white", alpha = 1) +
  
  # Add landmasses in grey
  geom_sf(data = world_map, fill = "lightgrey", color = "black", size = 0.2) +
  
  # Add high-density population areas in black
  geom_tile(data = high_density_df, aes(x = x, y = y), 
            fill = "black", width = 0.04, height = 0.04, alpha = 0.8) +
  
  # Add combined species ranges in red as a single layer
  geom_sf(data = combined_species_ranges, fill = "red", color = NA, alpha = 0.4) +
  
  # Add title and customize the map layout
  ggtitle("All Species Ranges Overlaid on Top 5% Human Population Density") +
  coord_sf(xlim = c(40, 125), ylim = c(10, 55), expand = FALSE) +  # Zoomed-in coordinates
  theme_minimal() +
  theme(
    panel.grid = element_blank(),  # Remove grid lines
    legend.position = "none",      # Remove the legend/key
    plot.title = element_text(size = 14, hjust = 0.5)  # Center-align the title
  )

# Display the map
print(human_pop_species_map)

# Save the map as a PNG in the results directory with specified size
ggsave("../results/human_population_species_overlay_unified.png", 
       plot = human_pop_species_map, width = 20, height = 12, dpi = 300)
