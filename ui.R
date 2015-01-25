library(shiny)
library(rCharts)
library(plyr)

shinyUI(pageWithSidebar(
  headerPanel("Citi Bike NYC"),
  
  sidebarPanel(
    conditionalPanel(
      'input.tabset === "Introduction"',
      h3("Author: Qi"),
      br(),
      h6("Execution Time:"),
      executiontime,
      hr(),
      h5("Table fields:"),
      HTML("<ul><li>id</li>
               <li>station name</li>
               <li>available docks</li>
               <li>total docks</li>
               <li>latitude</li>
               <li>longitude</li>
               <li>status value</li>
               <li>status key</li>
               <li>available bikes</li>
               <li>streed address1</li>
               <li>streed address2</li>
               <li>city</li>
               <li>postal code</li>
               <li>location</li>
               <li>altitude</li>
               <li>test station</li>
               <li>last communication time</li>
               <li>land mark</li></ul>")),
    
    conditionalPanel(
      'input.tabset === "Station Info"',
      h6("Execution Time:"),
      executiontime,
      hr(),
      h5("Station Info"),
      selectInput("option", "Please select a station:", 
                  choices=stationNames),
      hr(),
      selectInput("option2", "Please select number of nearest stations:", 
                  choices=c(0,5,10,15,20,25,30,35,40)),
      hr(),
      helpText("Customerized Chart will be added later.")
      ),
  
      conditionalPanel(
        'input.tabset === "Stations Map"',
        h6("Execution Time:"),
        executiontime,
        hr(),
        h5("Stations Map")
      ),
    conditionalPanel(
      'input.tabset === "Stations Table"',
      h6("Execution Time:"),
      executiontime,
      hr(),
      checkboxGroupInput('show_vars', 'Columns in table to show:',
                         fieldnames, selected = fieldnames))
  ),
  mainPanel(
    tabsetPanel(
      id="tabset",
      tabPanel("Introduction",verbatimTextOutput("intro")), 
      tabPanel("Station Info",htmlOutput("myInfo")), 
      tabPanel("Stations Table", dataTableOutput('datatable')),
      tabPanel("Stations Map", htmlOutput('dataMap'))
    )
  )
))