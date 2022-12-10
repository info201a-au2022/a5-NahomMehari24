library(shiny)
library(plotly)
library(tidyverse)

data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

 
## 3 DPLYR FUNCTION USES
max(data$flaring_co2, na.rm = TRUE)
## Console reads 439.254

min(data$methane_per_capita, na.rm = TRUE)
## Console reads 0

library(dplyr)

max(data$country, na.rm = TRUE)

## Console reads Zimbabwe as the country with the max

server <- function(input, output){
  output$PIE_CHART_CO2 <- renderPlotly({
    
  
  P <- data %>% 
    group_by(year) %>% 
    drop_na() %>% 
    summarise(year = unique(year),
    methane = sum(methane),
    flaring_co2 = sum(flaring_co2),
    coal_co2 = sum(coal_co2),
    
    co2 = sum(co2), .groups = "drop")
  
  
  
  Data_Pie_Chart <- P %>% 
    gather(key = Gases, value = Gas_Quantities, -year) %>% 
    group_by(Gases, Gas_Quantities)
  
  USER_PIE_CHART <- Data_Pie_Chart %>% 
    filter(Gases %in% input$PIE_CHART)
  
  Pie_Chart <- plot_ly(USER_PIE_CHART, labels = ~Gases, values = ~Gas_Quantities, type = 'pie')
  Pie_Chart <- Pie_Chart %>% layout(title = 'Pie Chart of Different climate change gases',
                        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  Pie_Chart <- Pie_Chart 
  return(Pie_Chart)
  }
  )

}


    

