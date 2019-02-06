library(shiny)

shinyUI(
  fluidPage(
        fluidRow(
        DT::dataTableOutput("the_data")
    #   )
    ),
    fluidRow(
      column(12, h3("Note: dates and edits are approximate", style = "color:#2C7873; font-size: 75%"))
    )
  ))
