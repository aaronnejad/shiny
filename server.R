library(shiny)

library(maps)
library(mapproj)
counties <- readRDS("data/counties.rds")
source("helpers.R")


shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      args <- switch(input$var,
                     "Percent GNP" = list(counties$white, "darkgreen", "% GNP"),
                     "Percent GDP" = list(counties$black, "black", "% GDP"),
                     "Percent GDP(excl Investments)" = list(counties$hispanic, "darkorange", "% GDP Excl Inv"),
                     "Percent GDP from Production" = list(counties$asian, "darkviolet", "% GDP Prod"))
      
      args$min <- input$range[1]
      args$max <- input$range[2]
      
      do.call(percent_map, args)
    })
  }
)