library(readxl)
library(readr)
NMDeaths <- read_excel('NMDeaths.xlsx')

WBNAid <- read_excel('WBNAid.xlsx')

DeathAid <- merge(NMDeaths, WBNAid, by = 'Year', all = TRUE)
names(DeathAid)[names(DeathAid) == "WB Aid"] <- "AidDollars"

NMDPlot = 
  NMDeaths |>
  ggplot(aes(x = Year, y = Deaths)) + 
  geom_line(
    color = '#E4257A'
  ) +
  geom_point() + 
  ggtitle('Maternal Deaths in Nigeria (2000 - 2020)') + 
  labs(
    y = 'Annual Maternal Deaths'
  ) +
  scale_y_continuous(
    breaks = c(60000, 65000, 70000, 75000, 80000, 85000), #How to make y axis start at 60K?
    labels = c('60K', '65K','70K', '75K', '80K', '85K')
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = 'bold'),
    axis.title.x = element_text(face = 'bold'),
    axis.title.y = element_text(face = 'bold')
  )
NMDPlot
