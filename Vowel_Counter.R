library(shiny)

# Function to count vowels in a word
count_vowels <- function(word) {
  # Define vowels
  vowels <- c("a", "e", "i", "o", "u", "A", "E", "I", "O", "U")
  
  # Split the word into individual characters
  chars <- strsplit(word, NULL)[[1]]
  
  # Count how many characters are in the vowels list
  vowel_count <- sum(chars %in% vowels)
  
  return(vowel_count)
}

# Define UI for the app
ui <- fluidPage(
  titlePanel("Vowel Counter"),
  
  sidebarLayout(
    sidebarPanel(
      # Input: Text box for user to enter a word
      textInput("word", "Enter a word:", value = ""),
      
      # Button to trigger vowel counting
      actionButton("countBtn", "Count Vowels")
    ),
    
    mainPanel(
      # Output: Display the number of vowels
      textOutput("vowel_count")
    )
  )
)

# Define server logic
server <- function(input, output) {
  observeEvent(input$countBtn, {
    # Render the result when the button is clicked
    output$vowel_count <- renderText({
      if (input$word == "") {
        return("Please enter a word.")
      } else {
        num_vowels <- count_vowels(input$word)
        paste("Number of vowels in", input$word, "is:", num_vowels)
      }
    })
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
