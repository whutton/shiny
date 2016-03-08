
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

test1 <- read.table("cancer.txt", 
                    header = TRUE, sep = ",", row.names = 1)

dt <- data.table(test1)
parse1 <- dt[,N,by=c('type','age')]  

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    zip2 <- parse1[ which(parse1$age== input$dage ), ]
    output$totalc <- renderPrint(sum(zip2[,N,]))
    pie(zip2$N,labels=zip2$type)

  })

})
