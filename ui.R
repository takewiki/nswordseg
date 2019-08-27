

shinyUI(fluidPage(
  
  # Application title
  titlePanel("网商语料分词"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h3('分词处理区：'),
      #br(),
      tsui(input.file(Id = 'raw_sound','上传聊天记录')),
      fluidRow(
        column(6,actionButton('do','预览分词结果',icon = icon('cube'))),
        column(6,mdl_download_button('download','下载处理后结果'))
      )
      ,
      h3('分词测试区：'),
      br(),
      aceEditor("code", mode="r", 
                value=c('上海网商电子商务有限公司\n你好我的朋友你想买什么东西'),
                fontSize = 16,
                theme =getAceThemes()[10] ,height = '150px'),
      actionButton("eval", "测试分词",icon = icon('calendar')),
      br(),
      h2("输出文本"),
      verbatimTextOutput("output")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3('预览分词处理结果：'),
      tsui::mdl_dataTable('data_view')
      
    )
  )
))








