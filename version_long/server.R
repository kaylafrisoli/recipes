library(shiny)
# library(googlesheets)
library(DT)
library(tidyverse)
recipes <- read_csv("recipes.csv")

recipe_data <- recipes %>%
  mutate(Title =  ifelse((link_type == "web" & !is.na(link_type)),
                         paste0('<a target=_blank href=', Link, '>', Title,'</a>' ),
                         Title),
         Date = as.Date(Date, "%m/%d/%y")) %>%
  select(-c(Link, link_type)) %>%
  arrange(desc(Date))


shinyServer(function(input, output, session) {
  
  output$the_data <- DT::renderDataTable({
    
    DT::datatable(recipe_data, rownames = FALSE,
              escape = FALSE,
              selection = "none",
              options = list(pageLength = 6)) %>%
      formatStyle(columns = c(2), width='290px') %>%
      formatStyle(columns = c(1), width='90px')
                             
                             # ,
                             # autoWidth = TRUE,
                             # columnDefs = list(list(targets=c(1), visible=TRUE, width='145'),
                             #                   list(targets=c(2), visible=TRUE, width='105'),
                             #                   list(targets=c(3), visible=TRUE, width='100'),
                             #                   list(targets=c(4), visible=TRUE, width='100'),
                             #                   list(targets='_all', visible=FALSE)),
                             # processing=FALSE))


  })
})
