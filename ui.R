library(shiny)
require(rCharts)
require(devtools)
options(RCHART_LIB = 'polycharts')
options(RCHART_LIB = 'NVD3')

# Define UI for application that draws a histogram
shinyUI(fluidPage(
#shinyUI(pageWithSidebar(
  # Application title
  titlePanel("Exploring NASA Exoplanet Archive"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      helpText("Kepler Object of Interest"),
      selectInput(inputId = "var1", label = "X-axis Variable",list("Orbital_Period"= "pl_orbper","Temperature" = "pl_eqt")),
      selectInput(inputId = "var2", label = "Y-axis Variable",list("Distance"= "pl_orbsmax", "Planet_Mass" = "pl_masse","Planet_Radius" = "pl_rade")),
      helpText("Confirmed Planet"),
      selectInput(inputId = "var3", label = "X-axis Variable",list("Temperature"= "koi_teq","Period"= "koi_period")),
      selectInput(inputId = "var4", label = "Y-axis Variable",list("Distance"= "koi_dor", "Eccentricity"= "koi_eccen"))

    ),
    # Show a plot of the generated distribution
    mainPanel(
  tabsetPanel(
    tabPanel("KOI", showOutput("plot1", "polycharts")),
    tabPanel("Confirmed Planet", showOutput("plot2", "polycharts")),
    tabPanel("Summary", showOutput("plot3", "NVD3"))
  )
)
)))


