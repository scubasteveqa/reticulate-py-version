library(shiny)
library(reticulate)

python_version <- as.character(py_config()$version) # Compute version upfront

ui <- fluidPage(
  titlePanel("Display the Python Version through reticulate"),
  span(paste("Python version:", python_version), id = "python_version")  # Render as static text
)

server <- function(input, output, session) {
  # No server-side updates required
}

shinyApp(ui, server)
