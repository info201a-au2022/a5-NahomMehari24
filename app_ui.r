library(shiny)
library(plotly)


Intro <- tabPanel(
h4("INTRO PAGE"), 
p("For this A5 Assignment, I decided to combine the gases of Co2, Methane, Flaring Co2, and Coal Co2. With these four gases I decided to make an interactive Pie Chart. Within this Pie Chart, you are able to click on whichever gas of choice, and a pie chart shall appear with the percentage of that gas and you can click on multiple of them in order to create the Pie Chart where it shows multiple of them with their percentages and raw amounts from the CSV dataset and it will paint a picture of a perfect interactive Pie Chart"), 
)

Second_Page <- tabPanel(
  h4("Chart Page"), 
  p("Explain This Page"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "PIE_CHART",
        label = "Pie Chart Climate change",
        choices = c("methane", "flaring_co2", "coal_co2", "co2"),
        multiple = TRUE
      )
    ),
    mainPanel(
      plotlyOutput(outputId = "PIE_CHART_CO2")
    )
  )
  
)
ui <- navbarPage(
  tags$title("Interactive1"),
  Intro,
  Second_Page
)
