#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Cocktail Ingredient Exploration"),

# Sidebar with a select (drop down box) and search input for Ingredients
    selectInput("select", label = h3("Type of Drink"), 
                choices = list("Cocktail Classics" = 1, "Cordials and Liqueurs" = 2, "Whiskies" = 3,
                               "Vodka" = 4, "Brandy" = 5, "Non-alcoholic Drinks" = 6), 
                selected = 1),
    hr(),
    fluidRow(column(3, verbatimTextOutput("value"))),
    
    selectInput("select", label = h3("Alcohol in Drink"), 
                choices = list("Rum" = 1, "Vodka" = 2, "Brandy" = 3, "Gin" = 4, "Scotch Whiskey" = 5,
                               "Amaretto" = 6, "Vermouth" = 7, "Bourbon whiskey" = 8, "Straight rye
                               whiskey" = 9, "Irish Whiskey" = 10, "Tennessee whiskey" = 11, "Blended
                               Scotch Whiskey" = 12, "Bourbon" = 13, "Absinthe" = 14, "Green Chartreuse" 
                               = 15), 
                selected = 1),
    hr(),
    fluidRow(column(3, verbatimTextOutput("value"))),
# Visual display of cocktail data.
    
        textInput(boston_cocktails$ingredient, label = h3("Ingredient"), value = "Enter text..."),
        hr(),
        fluidRow(column(5, verbatimTextOutput("ingredient")))
)

# Search for ingredients by name.


        # Render the boston_cocktails data table when calling for specific category or ingredient
        mainPanel(
            renderDataTable("boston_cocktails")
        )

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$value <- renderDataTable({boston_cocktails$ingredient})
}

# Run the application 
shinyApp(ui = ui, server = server)
