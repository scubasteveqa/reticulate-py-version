library(shiny)
library(reticulate)

ui <- fluidPage(
  titlePanel("Python Version in Shiny App"),
  verbatimTextOutput("python_version")
)

server <- function(input, output, session) {
  output$python_version <- renderPrint({
    python_version <- as.character(py_config()$version)
    cat("Python version:", python_version, "\n")
  })
}

shinyApp(ui, server)
