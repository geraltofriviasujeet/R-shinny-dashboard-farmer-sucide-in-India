# Server
server = function(input, output, session) {
  output$ud = renderPrint(
    
    mean(data$`Farmers/Cultivators - 2017`, na.rm = T)
   
  )
  output$sj = renderPrint(
    
    sd(data$`Farmers/Cultivators - 2017`, na.rm = T),
   
  )
  output$m = renderPrint(
    
    max(data$`Farmers/Cultivators - 2017`, na.rm = T)
  )
  output$head1 = renderText(
    
    max(data$`Farmers/Cultivators - 2017`, na.rm = T)
  )
  output$fd = renderPrint(
    
    mean(data$`Farmers/Cultivators - 2018`, na.rm = T)
    
  )
  output$mm = renderPrint(
    
    sd(data$`Farmers/Cultivators - 2018`, na.rm = T)
    
  )
  output$md = renderPrint(
    
    max(data$`Farmers/Cultivators - 2018`, na.rm = T)
  )
  output$ad = renderPrint(
    
    mean(data$`Farmers/Cultivators - 2019`, na.rm = T)
    
  )
  output$ma = renderPrint(
    
    sd(data$`Farmers/Cultivators - 2019`, na.rm = T)
    
  )
  output$mc = renderPrint(
    
    max(data$`Farmers/Cultivators - 2019`, na.rm = T)
  )
  output$aa = renderPrint(
    
    mean(data$`Farmers/Cultivators - 2020`, na.rm = T)
    
  )
  output$ac = renderPrint(
    
    sd(data$`Farmers/Cultivators - 2020`, na.rm = T)
    
  )
  output$dc = renderPrint(
    
    max(data$`Farmers/Cultivators - 2020`, na.rm = T)
  )
  output$dd = renderPrint(
    
    mean(data$`Farmers/Cultivators - 2021`, na.rm = T)
    
  )
  output$cc = renderPrint(
    
    sd(data$`Farmers/Cultivators - 2021`, na.rm = T)
    
  )
  output$ff = renderPrint(
    
    max(data$`Farmers/Cultivators - 2021`, na.rm = T)
  )
  
  #Structure
  output$structure = renderPrint(
    #structure
    data %>% 
      str()
  )
  #Summary
  output$summary = renderPrint(
    #Summary
    data %>% 
      summary()
    
  )
  #Data Table
  output$dataT = renderDataTable({
    datatable(data, options = list(scrollX = TRUE))
  })
  #stacked Histogram
  output$histplot = renderPlotly({# Histogram
    histogram <- data %>% 
      plot_ly() %>% 
      add_histogram(~get(input$var1)) %>% 
      layout(xaxis = list(title = input$var1))
    
    # Boxplot
    boxplot <- data %>% 
      plot_ly() %>% 
      add_boxplot(~get(input$var1)) %>% 
      layout(yaxis = list(showticklables = F))
    
    # Stacking plots using subplot
    subplot_list <- list(boxplot, histogram)  # Make sure to use a list
    
    # Create subplot
    subplot <- subplot(subplot_list, nrows = 2, shareX = TRUE) %>% 
      hide_legend() %>% 
      layout("Distribution Chart - Histogram and Boxplot",
             yaxis = list(title = "Frequency"))
    
  })
  output$bar <- renderPlotly({
    data %>% 
      plot_ly() %>% 
      add_bars(x=~State, y=~get(input$var1)) %>% 
      layout(title = paste("Statewise Sucide", input$var1),
             xaxis = list(title = "State"),
             yaxis = list(title = paste(input$var1, "Sucide") ))
  })

}
