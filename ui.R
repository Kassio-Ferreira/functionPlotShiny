#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(ui <- fluidPage(
  titlePanel("Gerador de gráficos"),
  
  sidebarLayout(
    sidebarPanel(position="right",
                 textInput("nome", "Nome da distribuição:", value = "Normal"),
                 textInput("func", "Densidade:", value = "1/(sigma*sqrt(2*pi)) * exp(-(x-mu)^2/(2*sigma^2))"),
                 textInput("args", "Parâmetros:", value="x=seq(-2,2,len=1000), sigma=1, mu=0"),
                 numericInput("X1", "Mínimo do X:", -2),
                 numericInput("X2", "Máximo do X:", 2),
                 #numericInput("maxX", "Máximo das abcissas:", 1),
                 #numericInput("minX", "Mínimo das abcissas:", -1),
                 numericInput("minY", "Mínimo das ordenadas:", 0),
                 numericInput("maxY", "Máximo das ordenadas:", 0.4),
                 submitButton("Desenhar")),
    
    mainPanel(
      plotOutput("plot")
    )
  )
  
    )
)
