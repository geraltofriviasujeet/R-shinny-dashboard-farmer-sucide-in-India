# Dashboard UI
ui <- dashboardPage(
  
  dashboardHeader(
    title = "Statewise Cases of Farmer Sucide",
    titleWidth = 650, 
    tags$li(class = "dropdown", tags$a(href = "https://www.linkedin.com/in/sujeet-kumar-339bb69b/", icon("linkedin"), "My Profile", target = "_blank")),
    tags$li(class = "dropdown", tags$a(href = "https://github.com/geraltofriviasujeet/R-shinny-dashboard-farmer-sucide-in-India", icon("github"), "Source code and Report", target = "_blank"))
  ),
  dashboardSidebar(
    sidebarMenu(
      id = "sidebar",
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-line")),
      menuItem(text = "Analysis", tabName = "ud", icon = icon("chart-line")),
      selectInput(inputId = "var1", label = "Select the Year", choices = choices1, selected = "2019 - CR")
    )
  ),
  
  dashboardBody(
    tabItems(
      #First tab item
      tabItem(tabName = "data",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This comprehensive dashboard provides a detailed overview of the State/UT-wise farmer Sucide due to various factors ")),
                                column(width = 4, tags$br() ,
                                      # tags$p("Abbrevations used are (CR) Child Rape, (CCS) Child Sexual Assault, (CON) Child Online Grooming, (PAR) Possession and Distribution of Child Abuse Material, (PCS) Child Sexual Exploitation, and (PCV) Child Victimization")
                                )
                              )  
                              
                     ),
                     tabPanel("Data",dataTableOutput("dataT")),
                     tabPanel("Structure",verbatimTextOutput("structure")),
                     tabPanel("Summary",verbatimTextOutput("summary")))),
      tabItem(tabName = "viz",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("Sucide Trends by States",value = "trends", plotlyOutput("bar")),
                     tabPanel("Distribution", value = "distro",plotlyOutput("histplot")))),
     tabItem(tabName = "ud",
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard gives different years farmers sucide and its basic descriptive statistics just select the year from the Tab")),
                                column(width = 4, tags$br())
                     
                     )),
                     tabPanel("Farmer Sucide 2017", print('Mean = '), verbatimTextOutput("ud"),print('Standard Deviation = '), verbatimTextOutput("sj"), print('Maximum Sucide in any state = '), verbatimTextOutput("m"),
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard gives different years farmers sucide and its basic descriptive statistics")),
                                column(width = 4, tags$br())
                              )),
                     tabPanel("Farmer Sucide 2018", print('Mean = '), verbatimTextOutput("fd"), print('Standard Deviation = '), verbatimTextOutput("mm"), print('Maximum Sucide in any state = '), verbatimTextOutput("md"),
                              fluidRow(
                              column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard gives different years farmers sucide and its basic descriptive statistics")),
                                column(width = 4, tags$br())
                              )),
                    tabPanel("Farmer Sucide 2019", print('Mean = '), verbatimTextOutput("ad"),print('Standard Deviation = '), verbatimTextOutput("ma"), print('Maximum Sucide in any state = '), verbatimTextOutput("mc"),
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard gives different years farmers sucide and its basic descriptive statistics")),
                                column(width = 4, tags$br())
                              )),
                     tabPanel("Farmer Sucide 2020", print('Mean = '), verbatimTextOutput("aa"),print('Standard Deviation = '), verbatimTextOutput("ac"), print('Maximum Sucide in any state = '), verbatimTextOutput("dc"),
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard gives different years farmers sucide and its basic descriptive statistics")),
                                column(width = 4, tags$br())
                              )),
                     tabPanel("Farmer Sucide 2021", print('Mean = '), verbatimTextOutput("dd"),print('Standard Deviation = '), verbatimTextOutput("cc"), print('Maximum Sucide in any state = '), verbatimTextOutput("ff"),
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard gives different years farmers sucide and its basic descriptive statistics")),
                                column(width = 4, tags$br())
                              ))
              ))
                    
                   #  tabPanel("CCS", verbatimTextOutput("CCS")),
                   #  tabPanel("CON", verbatimTextOutput("CON")),
                   #  tabPanel("PAR", verbatimTextOutput("PAR")),
                   #  tabPanel("PCS", verbatimTextOutput("PCS")),
                   #  tabPanel("PCV", verbatimTextOutput("PCV"))
)))
