# server.R
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)
data(counties)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      x <- switch(input$var, "Percent White" = "white", "Percent Black" = "black", "Percent Hispanic" = "hispanic", "Percent Asian" = "asian")
      y <- switch(input$var, "Percent White" = 'skyblue', "Percent Black" = 'yellow', "Percent Hispanic" = 'red', "Percent Asian" = 'green')
      percent_map( counties[, x], col = y, legend.title = input$var, min = input$range[1], max = input$range[2] )
    })
      
  }
)
    