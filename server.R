library(shiny)
library(devtools)
require(rCharts)
options(RCHART_WIDTH = 800)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plot1 <- renderChart({
    mytooltip = "#! function(item){return item.pl_name} !#"
    p1 <- rPlot(x = input$var1, y = input$var2, data = dfp1, type = "point",tooltip = mytooltip)
    p1$addParams(height = 400, dom = 'plot1')
    return(p1)
  })
  output$plot2 <- renderChart({
    p2 <- rPlot(x = input$var3, y = input$var4, data = dfk1, type = "point", color = "koi_disposition")
    p2$addParams(height = 400, dom = 'plot2')
    return(p2)
  }) 
    output$plot3 <- renderChart({
      p3 <- nPlot(x= "Year", y= "Freq", group = "Method", data = dfp2, type = "multiBarChart")
      p3$addParams(height = 400, dom = 'plot3')
      return(p3)
  })
})
