# Test
# Clear the workspace
rm(list = ls())

# Load necessary packages
library(tidyverse)
library(broom)

# Define input and output paths
data_path <- "../data/EcolArchives-E089-51-D1.csv"
pdf_output <- "../results/Visualizing_regressions.pdf"
csv_output <- "../results/PP_Regress_Results.csv"

# Read the dataset
if (!file.exists(data_path)) {
  stop("Input data file not found. Please ensure '../data/EcolArchives-E089-51-D1.csv' exists.")
}
data <- read.csv(data_path)

# Convert Prey.mass from mg to g (this actually results in the plot looking less like the example plot on TMQB)
# data <- data %>%
#  mutate(Prey.mass = ifelse(Prey.mass.unit == "mg", Prey.mass / 1000, Prey.mass),
#         Prey.mass.unit = "g") # Update the unit to 'g' for consistency

# Create output directory
if (!dir.exists("../results")) {
  dir.create("../results", showWarnings = FALSE)
}

# Define the plot
plot <- ggplot(data, aes(x = Prey.mass, y = Predator.mass, color = Predator.lifestage)) +
  geom_point(shape = 3) +  
  geom_smooth(
    method = "lm", 
    se = TRUE, 
    aes(color = Predator.lifestage), 
    linewidth = 0.5,
    fullrange = TRUE  
  ) +  
  scale_x_log10() +  
  scale_y_log10() +  
  labs(
    x = "Prey Mass in grams",
    y = "Predator mass in grams",
    color = "Predator.lifestage"  
  ) +
  facet_wrap(
    ~ Type.of.feeding.interaction,
    ncol = 1,
    strip.position = "right"  
  ) +
  theme_light() +  
  theme(
    legend.position = "bottom",  
    legend.text = element_text(size = 8),  
    legend.title = element_text(size = 8, face = "bold"),  
    legend.key = element_rect(fill = "lightgrey", color = "black", linewidth = 0.2),  
    legend.key.size = unit(4, "mm"),  
    legend.box.margin = margin(t = 0, r = 1, b = 0, l = 1),  
    legend.key.spacing.x = unit(2, "mm"),  
    axis.title.x = element_text(size = 9),  
    axis.title.y = element_text(size = 9),  
    strip.text = element_text(size = 7, face = "bold", color = "black"),  
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5),  
    strip.background = element_rect(color = "black", fill = "grey", linewidth = 0.5),  
    strip.placement = "outside",  
    plot.margin = margin(t = 10, r = 100, b = 10, l = 100)  
  ) +
  guides(
    color = guide_legend(nrow = 1)  
  )

# Save the plot to PDF
ggsave(filename = pdf_output, plot = plot, width = 8, height = 10, device = "pdf")
# Perform linear regression analysis
lm_results <- data %>%
  group_by(Type.of.feeding.interaction, Predator.lifestage) %>%
  summarise(
    lm_model = list(lm(Predator.mass ~ Prey.mass, data = cur_data())),
    .groups = "drop"
  )

# Extract and format regression details
detailed_results <- lm_results %>%
  mutate(
    model_summary = map(lm_model, glance),  # Model-level summaries
    tidy_summary = map(lm_model, tidy)     # Term-level coefficients
  ) %>%
  unnest(c(model_summary, tidy_summary), names_sep = "_") %>%  # Expand summaries
  filter(tidy_summary_term %in% c("(Intercept)", "Prey.mass")) %>%
  pivot_wider(
    names_from = tidy_summary_term,
    values_from = c(
      tidy_summary_estimate, tidy_summary_std.error, tidy_summary_statistic, tidy_summary_p.value
    ),
    names_glue = "{tidy_summary_term}_{.value}"
  ) %>%
  rename(
    Intercept = `(Intercept)_tidy_summary_estimate`,
    Intercept_Std_Error = `(Intercept)_tidy_summary_std.error`,
    Intercept_T_Statistic = `(Intercept)_tidy_summary_statistic`,
    Intercept_P_Value = `(Intercept)_tidy_summary_p.value`,
    Slope = `Prey.mass_tidy_summary_estimate`,
    Slope_Std_Error = `Prey.mass_tidy_summary_std.error`,
    Slope_T_Statistic = `Prey.mass_tidy_summary_statistic`,
    Slope_P_Value = `Prey.mass_tidy_summary_p.value`,
    R_Squared = model_summary_r.squared,
    Adjusted_R_Squared = model_summary_adj.r.squared,
    F_Statistic = model_summary_statistic,
    F_P_Value = model_summary_p.value
  ) %>%
  select(
    Type.of.feeding.interaction, Predator.lifestage,
    Intercept, Intercept_Std_Error, Intercept_T_Statistic, Intercept_P_Value,
    Slope, Slope_Std_Error, Slope_T_Statistic, Slope_P_Value,
    R_Squared, Adjusted_R_Squared, F_Statistic, F_P_Value
  )

# Save results to CSV
write.csv(detailed_results, csv_output, row.names = FALSE)
