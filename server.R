#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  output$plot<-renderPlot({
    
    eval(parse(text = paste('f <- function(', input$args, ') { return(' , input$func , ')}', sep='')))
    plot(seq(input$X1,input$X2, len=1000),f(), xlim=c(input$X1,input$X2), 
         ylim=c(input$minY,input$maxY), t='l', lwd=3, col="red",
         ylab="Suporte", xlab="Densidade", main=paste('Distribuição' , input$nome));
  }                        
  )              
})
