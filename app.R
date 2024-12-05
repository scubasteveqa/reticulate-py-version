library(shiny)
library(reticulate)

ui <- fluidPage(
  titlePanel("Display the Python Version through reticulate"),
  textOutput("python_version", inline = TRUE)  
)

server <- function(input, output, session) {
  output$python_version <- renderText({
    python_version <- as.character(py_config()$version)
    paste("Python version:", python_version)
  })
}

shinyApp(ui, server)
