library(shiny)

shinyUI(
  fluidPage(
        fluidRow(
                 DT::dataTableOutput("the_data")
    ),
    fluidRow(
      h3("Note: edits are approximate", style = "font-size: 75%")
    )
  ))
