#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
df <- read_csv('shots.csv')
#df %>% group_by(dice) %>% sample_n(1, weight = weight) %>% select(type, dice)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("shotpickR"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            actionButton("roll",
                        "Roll!"
                        )
        ),

        # Show a plot of the generated distribution
        mainPanel(
           htmlOutput("shot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    
    output$shot <- renderText({
        input$roll
        shot <- df %>% group_by(dice) %>% sample_n(1, weight = weight) %>% select(type, dice)
        paste0(shot$dice, ': ', shot$type, sep = '<br>')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
