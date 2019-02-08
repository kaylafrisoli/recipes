library(shiny)

shinyUI(
  fluidPage(
        fluidRow(
                 DT::dataTableOutput("the_data")
    ),
    fluidRow(
      h3("Note: dates and edits are approximate", style = "font-size: 75%")
    )
  ))
