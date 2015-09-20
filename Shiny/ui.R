library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Shiny example - Clustering of wines"),
  
  sidebarPanel(    
    sliderInput("numClusters",
                 "Number of Clusters",
                 min = 2,
                 max = 20,
                 value = 3,
                 step=1),

    tags$br(),
    actionButton("showAnalysis",
                 "Predict best clustering"),
    tags$br(),
    tableOutput("analysis")
    
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    helpText("Cluster wines from the wine dataset.
             Use the slider to set the number of clusters. 
             Press the button to get an estimation of what number of clusters would work best. note: estimating the number of clusters might take a while"),
    
    plotOutput("kmeans")
  )
))
