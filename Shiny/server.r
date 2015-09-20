library(shiny)
library(NbClust)
require(cluster)

data(wine,package="rattle")
dataset <- scale(wine[-1])
set.seed(3344)

shinyServer(

  function(input, output) {
  
    centers <- reactive({ input$numClusters })
              
    output$kmeans <- renderPlot({
    clusters <- kmeans(dataset,centers())
    clusplot(dataset,clusters$cluster,color=TRUE, main="clusters within the wine data")
    })
    
    observeEvent(input$showAnalysis,             
        output$analysis <- renderTable({
          withProgress(message='Calculating clusters, please wait', value=0.1, { 
                            
          clustAnalysis <- NbClust(dataset,min.nc=2,max.nc=20,method="kmeans")
          table(clustAnalysis$Best.nc[1,], deparse.level=2, dnn=c("nr proposed")) 
          })
        })
    )
  
  
  
  }

)
