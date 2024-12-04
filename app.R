library(shiny)
library(reticulate)

ui <- fluidPage(
  titlePanel("Python Version in Shiny App"),
  textOutput("python_version")
)

server <- function(input, output, session) {
  output$python_version <- renderText({
    python_version <- as.character(py_config()$version)
    paste("Python version:", python_version)
  })
}

shinyApp(ui, server)
