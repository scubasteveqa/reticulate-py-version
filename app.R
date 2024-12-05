library(shiny)
library(reticulate)

# Define UI
ui <- fluidPage(
  # Application title
  titlePanel("Shiny App with Python Version and Histogram"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      # Display the Python version
      textOutput("python_version"),
      # Show the histogram
      plotOutput("distPlot")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  # Render the Python version
  output$python_version <- renderText({
    python_version <- as.character(py_config()$version)
    paste("Python version:", python_version)
  })
  
  # Render the histogram
  output$distPlot <- renderPlot({
    # Generate bins based on input$bins from UI
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # Draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
}

# Run the application
shinyApp(ui = ui, server = server)
