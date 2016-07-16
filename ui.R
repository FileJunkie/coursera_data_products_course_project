library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Car fuel consumption prediction"),
  mainPanel(
    p('Just enter the number of engine displacement, the weight of your car and the engine power and get the predicted fuel consumption.'),
    sliderInput('disp', 'Disposition (cubic centimeters)', min = 500, max = 6000, value = 1400, step = 100),
    sliderInput('wt', 'Weight (kilograms)', min = 500, max = 3000, value = 1200, step = 50),
    sliderInput('hp', 'Engine power (horse powers)', min = 50, max = 500, value = 75, step = 5),
    htmlOutput('fuel')
  ),
  sidebarPanel(
    p('Source code for this application can be found on ', a('github.', href = 'https://github.com/FileJunkie/coursera_data_products_course_project')),
    p('You can download it, open it in RStudio, set the current directory to one containing the ui.R and server.R files, and do runApp().')
  )
))