model <<- lm(mpg ~ disp + wt + hp, data = mtcars)

predictConsumption <<- function(disp, wt, hp){
  dispCubInch <- disp / 16.3871
  wtThousandsPounds <- wt * 2.20462 / 1000

  mpg <- predict(model, data.frame(disp = dispCubInch, wt = wtThousandsPounds, hp = hp))[[1]]
  return(282.5 / mpg)
}

library(shiny)
shinyServer(
  function(input, output) {
    output$fuel <- renderUI(HTML(paste('Supposed fuel consumption: ', sprintf('%.02f', predictConsumption(input$disp, input$wt, input$hp)), ' liters per 100 km')))
  }
)
