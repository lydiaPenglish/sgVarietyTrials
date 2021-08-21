# Play with map making

library(ggplot2)
library(maps)
library(dplyr)

iowa <- map_data("county") %>%
  filter(region == "iowa")
locs <- readr::read_csv("data-raw/site_locs.csv")


ggplot()+
  geom_polygon(data = iowa, aes(x = long, y = lat, group = group),
               color = "black", fill = "white")+
  geom_point(data = locs, aes(x = long, y = lat, color = SiteID),
             size = 4)+
  guides(color = FALSE)+
  labs(x = NULL, y = NULL)+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.background = element_blank())
