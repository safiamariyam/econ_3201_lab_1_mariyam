rm(list=ls())

install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)
#library is used to call the package and let R know you need to use it. 
# Calculate the average highway mpg (miles per gallon) for each class of vehicle
avg_mpg <- mpg %>%
  group_by(class) %>%
  summarise(avg_hwy_mpg = mean(hwy, na.rm = TRUE))
# Plot the average highway mpg with class on the y-axis, all bars in light blue
ggplot(avg_mpg, aes(y = class, x = avg_hwy_mpg)) +
  geom_col(fill = "lightblue") + # Set all bars to light blue
  labs(title = "Average Highway MPG by Vehicle Class",
       y = "Vehicle Class",
       x = "Average Highway MPG") +
  theme_minimal()

