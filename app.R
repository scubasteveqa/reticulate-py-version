library(shiny)
library(reticulate)

ui <- fluidPage(
  titlePanel("Display the Python Version through reticulate"),
  textOutput("python_version")  # Use textOutput for plain text
)

server <- function(input, output, session) {
  output$python_version <- renderText({
    python_version <- as.character(py_config()$version)
    paste("Python version:", python_version)  # Generate plain text output
  })
}

shinyApp(ui, server)
