
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(data.table)
library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Cancer by Age"),
  h1("Cancer data from SEER"),
  includeHTML("background.txt"),
  # Sidebar with a slider input for age at diagnosis
  sidebarLayout(
    sidebarPanel(
      sliderInput("dage",
                  "Age at Diagnosis:",
                  min = 40,
                  max = 90,
                  value = 60)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      h4("Total cases in selected year"),
      verbatimTextOutput("totalc")
    )
  )
))
