library(RSelenium)
library(stringr)




# Se activa el driver para navegar
rD <- rsDriver(browser=c("firefox"))
remDr <- rD[["client"]]


# Para datos de todo el pais usar el siguiente link

#URL <- "https://www.elempleo.com/co/ofertas-empleo/"

# Para datos de las principales ciudades, usar los siguientes links 
#  Bogota
#URL <- "https://www.elempleo.com/co/ofertas-empleo/bogota"
#  Medellin
#URL <- "https://www.elempleo.com/co/ofertas-empleo/medellin"
#  Cali
#URL <- "https://www.elempleo.com/co/ofertas-empleo/cali"
#  Barranquilla
#URL <- "https://www.elempleo.com/co/ofertas-empleo/barranquilla"
#  Cartagena
URL <- "https://www.elempleo.com/co/ofertas-empleo/cartagena"


# Se inicia el navegador
remDr$open()
remDr$navigate(URL)

Sys.sleep(4)



# boton cookies

tryCatch({boton3<-remDr$findElement(using = 'xpath', value = "/html/body/div[10]/div/div[2]/a[2]")},error = function(e) {error<-0})
tryCatch({boton3$clickElement()},error = function(e) {error<-0})  

Sys.sleep(4)

#-------------------------------------------- salario --------------------------------------------

# si se desea optener el total de publicaciones se debe saltar este paso

# Elegir salario cambiando el numero segun las siguietes opciones

# Menos de $1  
  #sal<-2
# $1 a $1,5    
  #sal<-3
# $1,5 a $2    
  #sal<-4
# $2 a $2,5    
  #sal<-5
# $2,5 a $3    
  #sal<-6
# $3 a $3,5    
  #sal<-7
# $3,5 a $4    
  #sal<-8
# $4 a $4,5    
  #sal<-9
# $4,5 a $5,5  
  #sal<-10
# $5,5 a $6    
  #sal<-23
# $6 a $8     
  #sal<-27
# $8 a $10     
  #sal<-28
# $10 a $12,5 
  #sal<-29
# $12,5 a $15  
  #sal<-30
# $15 a $18   
  #sal<-31
# $18 a $21    
  #sal<-32
# Más de $21   
  #sal<-33




# Se construye el xpath segun el salario seleccionado
sala<-paste0("//*[@id='salary",sal)
sala<-paste0(sala,"']")


#se selecciona el salario
tryCatch({boton1<- remDr$findElement(using = 'xpath', value = sala)},error = function(e) {error<-0})
tryCatch({boton1$clickElement()},error = function(e) {error<-0})
Sys.sleep(4)


#-----------------------------------------------------------------------------------------------------


# Cantidad de ofertas

nm<-NULL
tryCatch({can1<- remDr$findElement(using = 'xpath', value = "/html/body/div[8]/div[3]/div[1]/h2/span[1]/strong[3]")},error = function(e) {error<-0})
tryCatch({nm<-can1$getElementText()},error = function(e) {error<-0})
nm<-as.numeric(nm)

Sys.sleep(4)

#-------------------------------------------------------------------------------------------------


# Seleccionar visualizacion de 100 empleos a la ves
#tryCatch({boton2<- remDr$findElement(using = 'xpath', value = "/html/body/div[8]/div[4]/div[1]/div[4]/div/form/div/select/option[3]")},error = function(e) {error<-0})
#tryCatch({boton2$clickElement()},error = function(e) {error<-0})

#Sys.sleep(4)

#------------------------------------------- ciclo---------------------------------------


# Se crean los vectors que se van a usar mas adelante
sueldo<-NULL
ciudad<-NULL
fecha<-NULL
empleo<-NULL
vacantes<-NULL
seccion<-NULL
area<-NULL
sarea<-NULL
empresa<-NULL
sector<-NULL
descripcion<-NULL
experiencia<-NULL
contrato<-NULL
nivedu<-NULL
nivel<-NULL
serial<-NULL
link<-NULL
control<-0
a<-0
jj<-2
cont<-0



# bucle principal

for(i in 1:nm){
  
# abrimos la oferta

Sys.sleep(5)  
  
  if (control==0){
j<-i %% 21
  }
  else{
  j<-(i+a) %% 21
  }
  


# boton de oferta, varias veces se tienen varios xpath para una misma fucion
# solo uno funciona por ves y a los demas se les captura como error
 
  
tryCatch({nn<-paste0("/html/body/div[8]/div[4]/div[1]/div[3]/div[",j)},error = function(e) {error<-0})
tryCatch({nn<-paste0(nn,"]/div[2]/button")},error = function(e) {error<-0})
  
tryCatch({boton3<-remDr$findElement(using = 'xpath', value = nn)},error = function(e) {error<-0})
tryCatch({boton3$clickElement()},error = function(e) {error<-0})  
  

tryCatch({nn<-paste0("/html/body/div[9]/div[4]/div[1]/div[3]/div[",j)},error = function(e) {error<-0})
tryCatch({nn<-paste0(nn,"]/div[2]/button")},error = function(e) {error<-0})

tryCatch({boton13<-remDr$findElement(using = 'xpath', value = nn)},error = function(e) {error<-0})
tryCatch({boton13$clickElement()},error = function(e) {error<-0})  


  
Sys.sleep(5)

# entrar en la oferta

tryCatch({boton4<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div/div/div[3]/div/div[2]/a")},error = function(e) {error<-0})
tryCatch({boton4$clickElement()},error = function(e) {error<-0})

tryCatch({boton4<- remDr$findElement(using = 'xpath', value = "/html/body/div[8]/div/div/div[3]/div/div[2]/a")},error = function(e) {error<-0})
tryCatch({boton4$clickElement()},error = function(e) {error<-0})


Sys.sleep(5)


# capturamos informacion

# Sueldo
tryCatch({su<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[1]/div[2]/div[1]/p[1]/span/span[1]")},error = function(e) {error<-0})
tryCatch({sueldo[i]<-su$getElementText()},error = function(e) {error<-0})

# Ciudad

tryCatch({ci<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[1]/div[2]/div[1]/p[2]/span/span/span[2]")},error = function(e) {error<-0})
tryCatch({ciudad[i]<-ci$getElementText()},error = function(e) {error<-0})

# Fecha 

tryCatch({fe<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[1]/div[2]/div[1]/p[3]/span[1]")},error = function(e) {error<-0})
tryCatch({fe<-fe$getElementText()},error = function(e) {error<-0})

tryCatch({fe<-gsub("Publicado","",fe)},error = function(e) {error<-0})
tryCatch({fecha[i]<-fe},error = function(e) {error<-0})

# titulo del empleo 

tryCatch({te<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[1]/h1/span")},error = function(e) {error<-0})
tryCatch({empleo[i]<-te$getElementText()},error = function(e) {error<-0})

# vacantes
tryCatch({va<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[1]/div[2]/div[2]/p[2]")},error = function(e) {error<-0})
tryCatch({va<-va$getElementText()},error = function(e) {error<-0})
tryCatch({va<- str_extract_all(va,"\\(?[0-9,.]+\\)?")},error = function(e) {error<-0})
tryCatch({vacantes[i]<-as.numeric(va)},error = function(e) {error<-0})


# Area

tryCatch({pr<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[1]/div[2]/div[2]/p[1]/span")},error = function(e) {error<-0})
tryCatch({area[i]<-pr$getElementText()},error = function(e) {error<-0})


# sub-Area

tryCatch({prs<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[1]/div[2]/div[2]/p[3]/span")},error = function(e) {error<-0})
tryCatch({sarea[i]<-prs$getElementText()},error = function(e) {error<-0})



# Empresa

tryCatch({em<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[2]/div[1]/div[2]/div[1]/h2/a/span/span/strong")},error = function(e) {error<-0})
tryCatch({empresa[i]<-em$getElementText()},error = function(e) {error<-0})

tryCatch({em<- remDr$findElement(using = 'xpath', value = "/html/body/div[8]/div[2]/div/div[2]/div/div[2]/p/span/span/strong")},error = function(e) {error<-0})
tryCatch({empresa[i]<-em$getElementText()},error = function(e) {error<-0})

tryCatch({em<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[2]/div/div[2]/p/span/span/strong")},error = function(e) {error<-0})
tryCatch({empresa[i]<-em$getElementText()},error = function(e) {error<-0})


# Sector de la empresa

tryCatch({sec<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[2]/div/div[2]/div/div[2]/div/span")},error = function(e) {error<-0})
tryCatch({sector[i]<-sec$getElementText()},error = function(e) {error<-0})

# descripcion general

tryCatch({des<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[3]/div[1]/div[1]/div/p[1]")},error = function(e) {error<-0})
tryCatch({descripcion[i]<-des$getElementText()},error = function(e) {error<-0})


# años de experiencia

tryCatch({ex<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[3]/div[1]/div[2]/div[2]/div[2]/p[1]/span")},error = function(e) {error<-0})
tryCatch({experiencia[i]<-ex$getElementText()},error = function(e) {error<-0})

# Serial

tryCatch({ni2<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[3]/div[1]/div[2]/div[2]/div[2]/p[3]/span")},error = function(e) {error<-0})
tryCatch({serial[i]<-ni2$getElementText()},error = function(e) {error<-0})


# tipo de contrato

tryCatch({tc<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[3]/div[1]/div[2]/div[2]/div[2]/p[2]/span")},error = function(e) {error<-0})
tryCatch({contrato[i]<-tc$getElementText()},error = function(e) {error<-0})

tryCatch({cont<-as.numeric(contrato[i])},error = function(e) {error<-0})

# cuando no aparece el tipo de contrato, el Xpath es el mismo que el de el serial, por lo que se hace el condicional
if(is.na(cont)==FALSE){
  serial[i]<-contrato[i]  
  contrato[i]<-"No especificado"
}
  

# Nivel educativo

tryCatch({ar<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[3]/div[1]/div[2]/div[2]/div[1]/p[3]/span")},error = function(e) {error<-0})
tryCatch({nivedu[i]<-ar$getElementText()},error = function(e) {error<-0})

# Nivel del profesional

tryCatch({ni<- remDr$findElement(using = 'xpath', value = "/html/body/div[7]/div[3]/div[1]/div[2]/div[2]/div[1]/p[1]")},error = function(e) {error<-0})
tryCatch({nivel[i]<-ni$getElementText()},error = function(e) {error<-0})


#link
tryCatch({link[i]<-remDr$getCurrentUrl()},error = function(e) {error<-0})

Sys.sleep(5)

#volver

remDr$goBack()
Sys.sleep(5)


# cuando se llegue a las 20 consultas, se reinicia el contador y se cambia de pestaña
if (j==20){
  boton5<- remDr$findElement(using = 'xpath', value = "/html/body/div[8]/div[4]/div[1]/div[4]/div/nav/ul/li[4]/a")
  boton5$clickElement() 
  control<-1
  a=a+1
  jj=jj+1
  Sys.sleep(5)
}




# seccion de la pestaña

tryCatch({nnn<-paste0("/html/body/div[8]/div[4]/div[1]/div[4]/div/nav/ul/li[",jj)},error = function(e) {error<-0})
tryCatch({nnn<-paste0(nnn,"]/a")},error = function(e) {error<-0})


tryCatch({boton7<-remDr$findElement(using = 'xpath', value = nnn)},error = function(e) {error<-0})
tryCatch({boton7$clickElement()},error = function(e) {error<-0})  


tryCatch({nnn<-paste0("/html/body/div[9]/div[4]/div[1]/div[4]/div/nav/ul/li[",jj)},error = function(e) {error<-0})
tryCatch({nnn<-paste0(nnn,"]/a")},error = function(e) {error<-0})


tryCatch({boton17<-remDr$findElement(using = 'xpath', value = nnn)},error = function(e) {error<-0})
tryCatch({boton17$clickElement()},error = function(e) {error<-0}) 




Sys.sleep(5)

}


#cierra el navegador al finalizar la captura

remDr$close()




#------------------- matriz  ------------------


# se crea una matriz con toda la informacion organizada por registros
x <-NULL
x <- matrix(nrow=length(area),ncol =16 ,byrow=T)

for(i in 1:length(area)){
  
  
  a<-empleo[i]
  a<-toString(a)
  x[i,1]<-a
  
  b<-sueldo[i]
  b<-toString(b)
  x[i,2]<-b
  
  c<-empresa[i]
  c<-toString(c)
  x[i,3]<-c
  
  d<-ciudad[i]
  d<-toString(d)
  x[i,4]<-d
  
  vacantes<-as.list(vacantes)
  e<-vacantes[i]
  e<-toString(e)
  x[i,5]<-e
  
  f<-fecha[i]
  f<-toString(f)
  x[i,6]<-f
  
  g<-experiencia[i]
  g<-toString(g)
  x[i,7]<-g
  
  h<-contrato[i]
  h<-toString(h)
  x[i,8]<-h
  
  k<-area[i]
  k<-toString(k)
  x[i,9]<-k
  
  
  u<-sarea[i]
  u<-toString(u)
  x[i,10]<-u
  
  
  l<-nivel[i]
  l<-toString(l)
  x[i,11]<-l
  
  
  o<-sector[i]
  o<-toString(o)
  x[i,12]<-o
  
  p<-nivedu[i]
  p<-toString(p)
  x[i,13]<-p
  
  r<-descripcion[i]
  r<-toString(r)
  x[i,14]<-r
  
  m<-serial[i]
  m<-toString(m)
  x[i,15]<-m
  
  t<-link[i]
  t<-toString(t)
  x[i,16]<-t
  
}

colnames(x)<-c("Empleo","Sueldo","Empresa","Ciudad","Vacantes","Fecha","Experiencia","Contrato","Area","Sub-area","Nivel","Sector","Nivel educativo","Descripcion","Serial","Link")

View(x)

# Se crea un archivo cvs en con la informacion recolectada

write.csv2(x,file=paste("Empleo",Sys.Date(),".csv",sep = "_"))





