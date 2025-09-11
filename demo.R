rm(list=ls())


library(ggplot2)
library(dplyr)
# Calculate the average highway mpg for each class of vehicle
avg_mpg <- mpg %>%
  group_by(class) %>%
  summarise(avg_hwy_mpg = mean(hwy, na.rm = TRUE))
# Create a column to assign colors (SUV gets a different color)
avg_mpg$class_color <- ifelse(avg_mpg$class == "suv", "red", "lightblue")
# Plot the average highway mpg with class on the y-axis
ggplot(avg_mpg, aes(y = class, x = avg_hwy_mpg, fill = class_color)) +
  geom_col() +
  scale_fill_identity() + # Use the colors defined in the data
  labs(title = "Average Highway MPG by Vehicle Class",
       y = "Vehicle Class",
       x = "Average Highway MPG") +
  theme_minimal()

