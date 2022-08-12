#install.packages("shinydashboard")
#install.packages("scales")

library(kknn)
library(ggplot2)
library(RMySQL)
library(DBI)
library("scales")

database<-dbConnect(MySQL(), user = "root", host = "localhost", password = "", dbname = "dali_greenwaste")
gen_data<-dbGetQuery(database, statement = "Select * From dataset")
on.exit(dbDisconnect(database))
head(gen_data)

# Ventas : 1 = Altas (> 50,000), 2 = Medias (16,000 - 49,999), 3 = Bajas (0 - 15,999)

df <- gen_data

set.seed(2020)
n = nrow(df)
muestra       <- sample(n, n*0.8)
entrenamiento <- df[muestra,]
prueba        <- df[-muestra,]


dim(entrenamiento)
dim(prueba)


p<-ggplot(data = entrenamiento, aes(x=producto, y=cantidad, color=(factor(ventas))))+ geom_point()
p

plot(factor(df$ventas), main = "Diagrama de cantidad de tipo de ventas")

plot(factor(df$producto), df$ventas, main = "Diagrama de cajas y bigotes")


#modelo optimal con Kmax=3
modelk3 <- train.kknn(factor(ventas) ~ ., data = entrenamiento, kmax = 3)
plot(modelk3)

#Predicción con K=3

summary(modelk3)

predictionk3 <- predict(modelk3, prueba[, -6])
print(predictionk3)

CMk3 <- table(prueba[, 6], predictionk3)
print(CMk3)

accuracyk3 <- (sum(diag(CMk3)))/sum(CMk3)
print(accuracyk3)

tablak3   <- table(predictionk3, factor(prueba$ventas))
tablak3
print(tablak3)

valoresk3 <- cbind(prueba, predictionk3) 

valoresk3
print(valoresk3)


#modelo optimal con Kmax=9
model <- train.kknn(factor(ventas) ~ ., data = entrenamiento, kmax = 9)


#Predicción con K=6-------------------------------------------------
summary(model)

prediction <- predict(model, prueba[, -6])
prediction
print(prediction)

CM <- table(prueba[, 6], prediction)
CM
print(CM)

accuracy <- (sum(diag(CM)))/sum(CM)
accuracy
print(accuracy)

plot(model)

tabla   <- table(prediction, factor(prueba$ventas))
tabla
print(tabla)

valores <- cbind(prueba, prediction) 
valores
print(valores)

boxplot(df$producto ~ factor(df$ventas), data = df, col = c("yellow"))

library(shiny)
library(shinydashboard)

ui <- dashboardPage(skin = "green",
  dashboardHeader(title = "GreenWaste"),
  dashboardSidebar(
    div(img(src = "img_logo_web.png", width = "50%", height = "50%"),
        style = "text-align: center;"),
    sidebarMenu(
      menuItem("Ventas", tabName = "v", icon = icon("money-bill")),
      menuItem("Frecuencia", tabName = "f", icon = icon("chart-line")),
      menuItem("Optimal", tabName = "k", icon = icon("chart-line")),
      menuItem("Tendencias por mes", tabName = "tendenciames", icon = icon("chart-line")),
      menuItem("Tendencias por año", tabName = "tendenciaanio", icon = icon("chart-line")),
      
      #rutas para graficas con k=3
      h6("Graficas con K3"),
      menuItem("Ventas con K=3", tabName = "ventask3", icon = icon("money-bill")),
      menuItem("Frecuencia con K=3", tabName = "frecuenciak3", icon = icon("chart-line")),
      menuItem("Tendencia con K=3", tabName = "tendenciak3", icon = icon("chart-line"))
    )
  ),
      dashboardBody(
        tabItems(
        # Primer tab
        tabItem(tabName = "v",
                titlePanel("GreenWaste"),
                fluidPage(
                  sidebarLayout(
                    sidebarPanel(
                      selectInput("select_producto", label = h3("Producto"), 
                                  choices = list("Lapiz" = 1, "Borrador" = 2, "Lapicera" = 3, "Jarra" = 4, "Telefono" = 5,
                                                 "Lapicero" = 6, "Libreta" = 7, "Colores" = 8, "Eco egg holder" = 9, "Television" = 10), 
                                  selected = 1),
                      selectInput("select_mes", label = h3("Mes"), 
                                  choices = list("Ninguno"=0,  "Enero" = 1, "Febrero" = 2, "Marzo" = 3, "Abril" = 4, "Mayo" = 5,
                                                 "Junio" = 6, "Julio" = 7, "Agosto" = 8, "Septiembre" = 9, "Octubre" = 10,
                                                 "Noviembre" = 11, "Diciembre" = 12), 
                                  selected = 1),
                      selectInput("select_anio", label = h3("Año"), 
                                  choices = list("Ninguno"=0,  "2013" = 2013, "2014" = 2014, "2015" = 2015, "2016" = 2016, "2017" = 2017,
                                                 "2018" = 2018, "2019" = 2019, "2020" = 2020, "2021" = 2021), 
                                  selected = 2013),
                    ),
                    
                    mainPanel(
                      h2("Diagrama de cantidad de tipo de ventas"),
                    
                      div("Este algoritmo permite ver a travez de una grafica los productos más vendidos y se categorizan de acuerdo a tres etiquetas que se 
                          representan en numero, cuyo significado son los siguientes: "),
                      h3("Etiquetas"),
                      p("1 = Altas (> 50,000)"),
                      p("2 = Medias (16,000 - 49,999)"),
                      p(" 3 = Bajas (0 - 15,999)"),
                      hr(),
                      plotOutput(outputId = "distPlot")
                      
                    )
                  )
                )
        ),
        #Segundo tab
        tabItem(tabName = "f",
                titlePanel("GreenWaste"),
                sidebarLayout(
                  sidebarPanel(
                    selectInput("select_anio_two", label = h3("Año"), 
                                choices = list("2013" = 2013, "2014" = 2014, "2015" = 2015, "2016" = 2016, "2017" = 2017,
                                               "2018" = 2018, "2019" = 2019, "2020" = 2020, "2021" = 2021), 
                                selected = 2013),
                    
                  ),
                  mainPanel(
                    h2("Diagrama de ventas de los productos por mes"),
                    div("Este grafica nos permite mostrar el compartimento de las ventas de los 10 productos que tenemos en nuestro dataset de acuerdo 
                        al mes seleccionas a traves del dropdownlist, asi mismo lo categoriza por las etiquetas de ventas las cuales son las siguientes: "),
                    h3("Etiquetas"),
                    p("1 = Altas (> 50,000)"),
                    p("2 = Medias (16,000 - 49,999)"),
                    p(" 3 = Bajas (0 - 15,999)"),
                    hr(),
                    plotOutput(outputId = "ggplot")
                    
                  )
                )
        ),
        #Tercer tab
        tabItem(tabName = "k",
                titlePanel("GreenWaste"),
                sidebarLayout(
                  sidebarPanel(
                  ),
                  mainPanel(
                    h2("Diagrama General del Algoritmo KNN"),
                    div("El parámetro k es un parámetro muy importante en el método, el cual se ajusta buscando la 
                        mejor clasificación con el conjunto de entrenamiento. "),
                    hr(),
                    plotOutput(outputId = "optimal")
                    
                  )
                )
        ),
        #CuartoItem
        tabItem(tabName = "tendenciames",
                titlePanel("GreenWaste"),
                sidebarLayout(
                  sidebarPanel(
                    selectInput("select_producto_tendencia", label = h3("Producto"), 
                                choices = list("Lapiz" = 1, "Borrador" = 2, "Lapicera" = 3, "Jarra" = 4, "Telefono" = 5,
                                               "Lapicero" = 6, "Libreta" = 7, "Colores" = 8, "Eco egg holder" = 9, "Television" = 10), 
                                selected = 1),
                    
                    selectInput("select_mesTendencia", label = h3("Mes"), 
                                choices = list("Ninguno"=0,  "Enero" = 1, "Febrero" = 2, "Marzo" = 3, "Abril" = 4, "Mayo" = 5,
                                               "Junio" = 6, "Julio" = 7, "Agosto" = 8, "Septiembre" = 9, "Octubre" = 10,
                                               "Noviembre" = 11, "Diciembre" = 12), 
                                selected = 1),
                    
                  ),
                  mainPanel(
                    h2("Diagrama de Tendencia del Producto al Año"),
                    div("El parámetro k es un parámetro muy importante en el método, el cual se ajusta buscando la 
                        mejor clasificación con el conjunto de entrenamiento. "),
                    h3("Etiquetas"),
                    p("1 = Altas (> 50,000)"),
                    p("2 = Medias (16,000 - 49,999)"),
                    p(" 3 = Bajas (0 - 15,999)"),
                    hr(),
                    plotOutput(outputId = "tendencia")
                    
                  )
                )
        ),
        
        #QuintoItem
        tabItem(tabName = "tendenciaanio",
                titlePanel("GreenWaste"),
                sidebarLayout(
                  sidebarPanel(
                    selectInput("select_producto_tendencia", label = h3("Producto"), 
                                choices = list("Lapiz" = 1, "Borrador" = 2, "Lapicera" = 3, "Jarra" = 4, "Telefono" = 5,
                                               "Lapicero" = 6, "Libreta" = 7, "Colores" = 8, "Eco egg holder" = 9, "Television" = 10), 
                                selected = 1),
                    
                    selectInput("select_aniotendencia", label = h3("Año"), 
                                choices = list("Ninguno"=0,  "2013" = 2013, "2014" = 2014, "2015" = 2015, "2016" = 2016, "2017" = 2017,
                                               "2018" = 2018, "2019" = 2019, "2020" = 2020, "2021" = 2021), 
                                selected = 2013),
                    
                  ),
                  mainPanel(
                    h2("Diagrama de Tendencia del Producto al mes"),
                    div("El parámetro k es un parámetro muy importante en el método, el cual se ajusta buscando la 
                        mejor clasificación con el conjunto de entrenamiento. "),
                    h3("Etiquetas"),
                    p("1 = Altas (> 50,000)"),
                    p("2 = Medias (16,000 - 49,999)"),
                    p(" 3 = Bajas (0 - 15,999)"),
                    hr(),
                    plotOutput(outputId = "tendenciaanio")
                    
                  )
                )
        ),
        # Sexto tab
        tabItem(tabName = "ventask3",
                titlePanel("GreenWaste"),
                fluidPage(
                  sidebarLayout(
                    sidebarPanel(
                      selectInput("select_producto_k3", label = h3("Producto"), 
                                  choices = list("Lapiz" = 1, "Borrador" = 2, "Lapicera" = 3, "Jarra" = 4, "Telefono" = 5,
                                                 "Lapicero" = 6, "Libreta" = 7, "Colores" = 8, "Eco egg holder" = 9, "Television" = 10), 
                                  selected = 1),
                      selectInput("select_mes_k3", label = h3("Mes"), 
                                  choices = list("Ninguno"=0,  "Enero" = 1, "Febrero" = 2, "Marzo" = 3, "Abril" = 4, "Mayo" = 5,
                                                 "Junio" = 6, "Julio" = 7, "Agosto" = 8, "Septiembre" = 9, "Octubre" = 10,
                                                 "Noviembre" = 11, "Diciembre" = 12), 
                                  selected = 1),
                      selectInput("select_anio_k3", label = h3("Año"), 
                                  choices = list("Ninguno"=0,  "2013" = 2013, "2014" = 2014, "2015" = 2015, "2016" = 2016, "2017" = 2017,
                                                 "2018" = 2018, "2019" = 2019, "2020" = 2020, "2021" = 2021), 
                                  selected = 2013),
                    ),
                    
                    mainPanel(
                      h2("Diagrama de cantidad de tipo de ventas con K3"),
                      
                      div("Este algoritmo permite ver a travez de una grafica los productos más vendidos y se categorizan de acuerdo a tres etiquetas que se 
                          representan en numero, cuyo significado son los siguientes: "),
                      h3("Etiquetas"),
                      p("1 = Altas (> 50,000)"),
                      p("2 = Medias (16,000 - 49,999)"),
                      p(" 3 = Bajas (0 - 15,999)"),
                      hr(),
                      plotOutput(outputId = "distPlotk3")
                      
                    )
                  )
                )
        ),
        #Septimo tab
        tabItem(tabName = "frecuenciak3",
                titlePanel("GreenWaste"),
                sidebarLayout(
                  sidebarPanel(
                    selectInput("select_anio_two_k3", label = h3("Año"), 
                                choices = list("2013" = 2013, "2014" = 2014, "2015" = 2015, "2016" = 2016, "2017" = 2017,
                                               "2018" = 2018, "2019" = 2019, "2020" = 2020, "2021" = 2021), 
                                selected = 2013),
                    
                  ),
                  mainPanel(
                    h2("Diagrama de ventas de los productos por mes con K3"),
                    div("Este grafica nos permite mostrar el compartimento de las ventas de los 10 productos que tenemos en nuestro dataset de acuerdo 
                        al mes seleccionas a traves del dropdownlist, asi mismo lo categoriza por las etiquetas de ventas las cuales son las siguientes: "),
                    h3("Etiquetas"),
                    p("1 = Altas (> 50,000)"),
                    p("2 = Medias (16,000 - 49,999)"),
                    p(" 3 = Bajas (0 - 15,999)"),
                    hr(),
                    plotOutput(outputId = "ggplotk3")
                    
                  )
                )
        ),
        #Octavo tab
      
        tabItem(tabName = "tendenciak3",
                titlePanel("GreenWaste"),
                sidebarLayout(
                  sidebarPanel(
                    selectInput("select_producto_tendencia_k3", label = h3("Producto"), 
                                choices = list("Lapiz" = 1, "Borrador" = 2, "Lapicera" = 3, "Jarra" = 4, "Telefono" = 5,
                                               "Lapicero" = 6, "Libreta" = 7, "Colores" = 8, "Eco egg holder" = 9, "Television" = 10), 
                                selected = 1),
                    
                    selectInput("select_mesTendencia_k3", label = h3("Mes"), 
                                choices = list("Ninguno"=0,  "Enero" = 1, "Febrero" = 2, "Marzo" = 3, "Abril" = 4, "Mayo" = 5,
                                               "Junio" = 6, "Julio" = 7, "Agosto" = 8, "Septiembre" = 9, "Octubre" = 10,
                                               "Noviembre" = 11, "Diciembre" = 12), 
                                selected = 1),
                    
                  ),
                  mainPanel(
                    h2("Diagrama de Tendencia del Producto al Año con K3"),
                    div("El parámetro k es un parámetro muy importante en el método, el cual se ajusta buscando la 
                        mejor clasificación con el conjunto de entrenamiento. "),
                    h3("Etiquetas"),
                    p("1 = Altas (> 50,000)"),
                    p("2 = Medias (16,000 - 49,999)"),
                    p(" 3 = Bajas (0 - 15,999)"),
                    hr(),
                    plotOutput(outputId = "tendenciak3")
                    
                  )
                )
        )
      )
    )
  
)

server <- function(input, output) {
  #output$value <- renderPrint({ input$select })
  
  #---GRAFICACIÓN DE LA GRAFICA VENTAS CON K6---------TabItem_1
  output$distPlot <- renderPlot({
    
    resultados <- subset(valores, producto == input$select_producto)
    
    if(input$select_anio != 0){
      resultados <- subset(resultados, anio == input$select_anio)
    }
    
    if(input$select_mes != 0){
      resultados <- subset(resultados, mes == input$select_mes)
    }
    if(nrow(resultados) != 0){
      plot(factor(resultados$prediction), main = "", col = c("#FBEC85", "#FE8100", "#FBEC85")) 
    }
    
    
  })
  
  #---GRAFICACIÓN DE LAS FRECUENCIAS CON K6---------TabItem_2
  
  output$ggplot <- renderPlot({
    
    
    resultados1 <- subset(valores, anio == input$select_anio_two)
    
    if(input$select_anio_two != 0){
      resultados1 <- subset(resultados1, anio== input$select_anio_two)
    }
    if(nrow(resultados1) != 0){
      ggplot(data = resultados1, aes(x=producto, y=cantidad, color=(factor(prediction))))+ geom_point()+scale_x_discrete(limit = c(1,2, 3, 4, 5, 6, 7, 8, 9, 10))
      ##plot(factor(resultados$producto), main = "Diagrama de cantidad de tipo de ventas", col = c("blue", "yellow", "red")) 
    }
    
    
  })
  #---GRAFICACIÓN DE LA GRAFICA GENERAL KNN---------TabItem_3
  
  output$optimal <- renderPlot({
        plot(train.kknn(factor(ventas) ~ ., data = entrenamiento, kmax = 9))  

    })
  
  #---GRAFICACIÓN DE LA GRAFICA TENDENCIAS CON K6---------TabItem_4
  output$tendencia <- renderPlot({
    
    
    resultadoTendencia <- subset(valores, producto == input$select_producto_tendencia)
    print(resultadoTendencia)
    

    if(input$select_producto_tendencia != 0){
      resultadoTendencia <- subset(resultadoTendencia, producto== input$select_producto_tendencia)
    }
    if(input$select_mesTendencia != 0){
      resultadoTendencia <- subset(resultadoTendencia, mes == input$select_mesTendencia)
    }
    if(nrow(resultadoTendencia) != 0){
      ggplot(data = resultadoTendencia, aes(x=anio , y=(factor(prediction)), color=(factor(prediction))))+ geom_point()+scale_x_discrete(limit = c(2013,2014,2015,2016,2017,2018,2019,2020,2021))+scale_y_discrete(limit = c(1,2,3))

    }
    
  })
  #______________________________________________________________________________________________________________________________________________________#
  #---GRAFICACIÓN DE LA GRAFICA TENDENCIAS CON K6---------TabItem_5
  output$tendenciaanio <- renderPlot({
    
    
    resultadoTendencia <- subset(valores, producto == input$select_producto_tendencia)
    print(resultadoTendencia)
    
    
    if(input$select_producto_tendencia != 0){
      resultadoTendencia <- subset(resultadoTendencia, producto== input$select_producto_tendencia)
    }
    if(input$select_aniotendencia != 0){
      resultadoTendencia <- subset(resultadoTendencia, anio == input$select_aniotendencia)
    }
    if(nrow(resultadoTendencia) != 0){
      ggplot(data = resultadoTendencia, aes(x=mes , y=(factor(prediction)), color=(factor(prediction))))+ geom_point()+scale_x_discrete(limit = c("ENE", "FEB", "MAR", "ABR", "MAY", "JUN", "JUL", "AGO", "SEP", "OCT", "NOV", "DIC"))+scale_y_discrete(limit = c(1,2,3))
      
    }
    
  })
  #______________________________________________________________________________________________________________________________________________________#
  #---GRAFICACIÓN DE LA GRAFICA VENTAS CON K6---------TabItem_6
  output$distPlotk3 <- renderPlot({
    
    resultadosk3 <- subset(valoresk3, producto == input$select_producto_k3)
    
    if(input$select_anio_k3 != 0){
      resultadosk3 <- subset(resultadosk3, anio == input$select_anio_k3)
    }
    
    if(input$select_mes_k3 != 0){
      resultadosk3 <- subset(resultadosk3, mes == input$select_mes_k3)
    }
    if(nrow(resultadosk3) != 0){
      plot(factor(resultadosk3$predictionk3), main = "", col = c("#FBEC85", "#FE8100", "#FBEC85")) 
    }
    
    
  })
  
  #---GRAFICACIÓN DE LAS FRECUENCIAS CON K6---------TabItem_7
  
  output$ggplotk3 <- renderPlot({
    
    
    resultados1k3 <- subset(valoresk3, anio == input$select_anio_two_k3)
    
    if(input$select_anio_two_k3 != 0){
      resultados1k3 <- subset(resultados1k3, anio== input$select_anio_two_k3)
    }
    if(nrow(resultados1k3) != 0){
      ggplot(data = resultados1k3, aes(x=producto, y=cantidad, color=(factor(predictionk3))))+ geom_point()+scale_x_discrete(limit = c(1,2, 3, 4, 5, 6, 7, 8, 9, 10))
      ##plot(factor(resultados$producto), main = "Diagrama de cantidad de tipo de ventas", col = c("blue", "yellow", "red")) 
    }
    
    
  })
  
  #---GRAFICACIÓN DE LA GRAFICA TENDENCIAS CON K6---------TabItem_8
  output$tendenciak3 <- renderPlot({
  
    resultadoTendenciak3 <- subset(valoresk3, producto == input$select_producto_tendencia_k3)
    print(resultadoTendenciak3)
    
    
    if(input$select_producto_tendencia_k3 != 0){
      resultadoTendenciak3 <- subset(resultadoTendenciak3, producto== input$select_producto_tendencia_k3)
    }
    if(input$select_mesTendencia_k3 != 0){
      resultadoTendenciak3 <- subset(resultadoTendenciak3, mes == input$select_mesTendencia_k3)
    }
    if(nrow(resultadoTendenciak3) != 0){
      ggplot(data = resultadoTendenciak3, aes(x=anio , y=(factor(predictionk3)), color=(factor(predictionk3))))+ geom_point()+scale_x_discrete(limit = c(2013,2014,2015,2016,2017,2018,2019,2020,2021))+scale_y_discrete(limit = c(1,2,3))
      
    }
    
  })
  
 
}
shinyApp(ui = ui, server = server)
