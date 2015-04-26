library(shiny)

# Important note. Make sure that the data folder, server.R ui.R and helpers.R are in the current 
# working directory. Makke sure that the data folder has the counties file in it. 

# Please note that the figures in this shiny application will not be correct so please do not make any investment decisions 
#based on these results. I have talen a file with ethnic figures of each county and pretended that they are measures of GDP.
#I did this because I dont have actual GDP figures for each county.


shinyUI(fluidPage(
  titlePanel("GDPVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create macroeconomic maps with 
        information from the 2010 US Eco figures."),
      h5('This applicatiion allows us to monitor the percentage on the national curve 
         each county ranks in terms of the chosen economic statistic. For example if we narrow the slider below to 
      only include 50-60th percentile for the chosen economic measure. It will only highlight on the map counties
      that have that range. Example 0% indicates that it is on the bottom of the curve and 100% indicates that it is 
      the wealthiest.
         ')
      ,
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent GNP", "Percent GDP",
                              "Percent GDP(excl Investments)", "Percent GDP from Production"),
                  selected = "Percent GDP"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
    mainPanel(plotOutput("map"))
  )
))
