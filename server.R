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
  
  output$the_data <- renderDataTable({
    
    datatable(recipe_data, rownames = FALSE,
              escape = FALSE,
              selection = "none",
              options = list(pageLength = 6)) %>% formatStyle(columns = c( 2), width=c('290px'))

  })

})
