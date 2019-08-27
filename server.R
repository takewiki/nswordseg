#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  data_sound <- eventReactive(input$do,{
    res <-nrcsrobot::read_kflog(file = input$raw_sound$datapath);
    source <- res$FkfLog;
    res$target <- segList2Vec(segmentCN(source))
    names(res) <-c('原始语料','分词后词料')
    return(res)
    
    
  })
  
  tsui::run_dataTable(tsui::proc_dataTable,'data_view',data_sound())
  
  tsui::run_download_button(proc_func = proc_download_button,
                            id = 'download',
                            data = data_sound(),
                            filename =function(){
                              paste('网商分词处理后结果',Sys.Date(),'.xlsx',sep='')
                            },func = openxlsx::write.xlsx) 
  
   
  output$output <- renderPrint({
    input$eval
    return(isolate({
      # cat(
      #   paste(
      #     segmentCN(input$code)
      #     ,collapse = " "
      #   )
      # )
      
  cat(segList(segmentCN(editor_char(input$code))))
    }))
  })
  
})
