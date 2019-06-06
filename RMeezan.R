install.packages("leaflet")
library(dplyr)
library(leaflet)
library(shiny)
library(shinydashboard)

ui <- leafletOutput("m", height = 800)
server <- function(input, output) { 
  a <- read.csv("Competitorsv2.csv", header = T)
  output$m <- renderLeaflet({leaflet() %>%
      addTiles() %>%
      addMarkers(lng=a$Longitude, lat=a$Latitude,
                 popup=a$Name)
    })
  
}
shinyApp(ui, server)

