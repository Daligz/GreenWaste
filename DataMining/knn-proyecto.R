library(kknn)
library(ggplot2)
library(RMySQL)
library(DBI)
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

model <- train.kknn(factor(ventas) ~ ., data = entrenamiento, kmax = 9)

summary(model)

prediction <- predict(model, prueba[, -6])
prediction

CM <- table(prueba[, 6], prediction)
CM

accuracy <- (sum(diag(CM)))/sum(CM)
accuracy

plot(model)

tabla   <- table(prediction, factor(prueba$ventas))
tabla

boxplot(df$producto ~ factor(df$ventas), data = df, col = c("yellow"))

library(shiny)

ui <- fluidPage(
  
  titlePanel("NO SE QUE TITULO  PONER"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput("select_produto", label = h3("Producto"), 
                  choices = list("1" = 1, "2" = 2, "3" = 3, "4" = 4, "5" = 5,
                                 "6" = 6, "7" = 7, "8" = 8, "9" = 9, "10" = 10), 
                  selected = 1),
      
      selectInput("select_mes", label = h3("Mes"), 
                  choices = list("1" = 1, "2" = 2, "3" = 3, "4" = 4, "5" = 5,
                                 "6" = 6, "7" = 7, "8" = 8, "9" = 9, "10" = 10,
                                 "11" = 11, "12" = 12), 
                  selected = 1),
      
      selectInput("select_anio", label = h3("Año"), 
                  choices = list("2013" = 2013, "2014" = 2014, "2015" = 2015, "2016" = 2016, "2017" = 2017,
                                 "2018" = 2018, "2019" = 2019, "2020" = 2020, "2021" = 2021), 
                  selected = 2013),
      
    ),
    
    mainPanel(
      
      plotOutput(outputId = "distPlot")
      
    )
  )
)

server <- function(input, output) {
  #output$value <- renderPrint({ input$select })
  output$distPlot <- renderPlot({
    
    plot(factor(df$ventas), main = "Diagrama de cantidad de tipo de ventas")
    
  })
  
}

shinyApp(ui = ui, server = server)