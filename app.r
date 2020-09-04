library(shiny)
library(tidyverse)

# Define UI ----
ui <- fluidPage(
  # App title ----
  titlePanel("Phase 2 Flight Number Summary"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Dropdown to select tail number ----
      selectInput("flight_number",
                  h3("Flight Number"),
                  choices = list("652"=652, "653"=653, "654"=654, "655"=655,
                                 "656"=656, "657"=657, "658"=658, "659"=659,
                                 "660"=660, "661"=661, "662"=662, "663"=663,
                                 "664"=664, "665"=665, "666"=666, "667"=667),
                  selected = 652
                  )
            ),
    
      # Main panel for displaying outputs ----
      mainPanel(
              # Output: Summary Display ----
              #textOutput("selected_var")
              tableOutput("summary_table")
              #dataTableOutput or tableOutput
              )
      
            
          )
)

# Define server logic ----
server <- function(input, output) {
  # output$selected_var <- renderText({ 
  #   paste("You have selected", input$flight_number)
  # })
  summary_df <- read.csv("blac_summary_df.csv")
  cols <- c("tail_number","file_name","number_anomalies", "rate_anomalies")
  output$summary_table <- renderTable({filter(summary_df, tail_number==input$flight_number)[cols]})
}

# Run the app ----
shinyApp(ui = ui, server = server)
