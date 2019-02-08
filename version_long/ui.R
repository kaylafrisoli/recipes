library(shiny)

shinyUI(
  fluidPage(
    tags$link(
    rel = "stylesheet", 
    href="https://fonts.googleapis.com/css?family=Montserrat"
  ),
    fluidRow(      
      column(12,
             h1("What I'm cooking...", style="font-style: cursive;
                font-family: 'Montserrat'; font-family: sans-serif")
             )
      ),
    fluidRow(
      column(12, 
            div(h3("View on: "),
                style="display: inline-block; vertical-align:center; font-size: 60%;
                font-family: Montserrat; font-family: sans-serif"),
             div(a("my website, ", href = "http://stat.cmu.edu/~kfrisoli", target="_blank"),
                 style="display: inline-block;vertical-align:center;
                font-family: Montserrat; font-family: sans-serif"), 
             div(a("GitHub", href = "https://github.com/kaylafrisoli/recipes", target="_blank"),
                 style="display: inline-block;vertical-align:center;
                font-family: Montserrat; font-family: sans-serif")
      )
    ),
    fluidRow(
      br(),
      column(12, 
        DT::dataTableOutput("the_data")
      )
    ),
    fluidRow(
      column(12, h3("Note: dates and edits are approximate", style = "font-size: 75%"))
    )
  ))
