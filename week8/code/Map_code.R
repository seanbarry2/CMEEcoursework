# Plot the map
range_map <- ggplot() +
  # Add world map
  geom_sf(data = world_map, fill = "lightgray", color = "black", size = 0.2) +
  
  # Add Goitered gazelle range in red
  geom_sf(data = goitered_gazelle, aes(fill = "Goitered gazelle"), alpha = 0.6, color = NA) +
  
  # Add all other species as a single blue layer
  geom_sf(data = other_species_combined, aes(fill = "Other species"), alpha = 0.6, color = NA) +
  
  # Customize the map with zoomed-in coordinates
  coord_sf(xlim = c(40, 125), ylim = c(10, 55), expand = FALSE) +  # Adjust x and y limits for the region of interest
  
  # Add manual legend for the layers
  scale_fill_manual(
    name = "Species",
    values = c(
      "Goitered gazelle" = "#CC0000",
      "Other species" = "#0000CC"
    ),
    labels = c("Goitered gazelle", "All other species")
  ) +
  
  # Add title and theme adjustments
  ggtitle("Goitered Gazelle Range Compared to Remaining Species") +
  theme_bw() +  # Use a white background
  theme(
    legend.position = "right",  # Display legend on the right
    panel.grid = element_blank(),  # Remove grid lines
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )

# Display the map
print(range_map)

# Save the grid plot as a PNG in the results directory
ggsave("../results/goitered_gazelle_vs_all.png", plot = range_map, width = 10, height = 6, dpi = 300)
