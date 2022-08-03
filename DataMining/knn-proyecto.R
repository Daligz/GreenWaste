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