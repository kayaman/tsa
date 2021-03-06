### Ex.3 ##

# Simule numeros aleatórios seguindo o processo {at} tal que at ~N(0.1). A partir desses valores simulados,
# obtenha séries de 1000 observações correspondentes aos processos (b), (c) e (e) do exercicio 2

### Simulações de valores {at}

require(graphics)

set.seed(666)

N <- 1000

At <- rnorm(N,0,1)

### Item (b) - 

x1 <- arima.sim(n=N, list(ar=c(0.3,-0.585)), innov=At)

par(mfrow = c(1,1)) # set up the graphics

ts.plot(x1, main="Ex.3(b) - Generated by arima.sim()")

par(mfrow = c(2,1)) # set up the graphics

r.acf<-acf(x1,type="correlation",plot=T,main="Ex.3(b)") 
ar.pacf<-acf(x1,type="partial",plot=T,main="Ex.3(b)")

# ---- Simulando os passos para a construção do processo manualmente -----#

x1m <- ts(data=rep(0,N),start=1,end=N, frequency=1,delta=1)

# Setando as mesmas observações iniciais para comparação
x1m[1] <- x1[1]
x1m[2] <- x1[2]

# Construção da Série manualmente
for(i in 3:N) 
  x1m[i] <- 0.3*x1m[i-1]-0.585*x1m[i-2]+At[i]

par(mfrow = c(1,1)) # set up the graphics

ts.plot(x1m, main="Ex.3(b) - Generated Manually")

par(mfrow = c(2,1)) # set up the graphics

r.acf<-acf(x1m,type="correlation",plot=T,main="Ex.3(b) - Manually") 
ar.pacf<-acf(x1m,type="partial",plot=T,main="Ex.3(b) - Manually")

### Item (c)

x2 <- arima.sim(n=1000, list(ar=c(0.4), ma=c(-0.3,-0.8)), innov=At)

par(mfrow = c(1,1)) # set up the graphics

ts.plot(x2, main="Ex.3(c) - Generated by arima.sim()")

par(mfrow = c(2,1)) # set up the graphics

r.acf<-acf(x2,type="correlation",plot=T,main="Ex.3(c)") 
ar.pacf<-acf(x2,type="partial",plot=T,main="Ex.3(c)")

# ---- Simulando os passos para a construção do processo manualmente -----#

x2m <- ts(data=rep(0,N),start=1,end=N, frequency=1,delta=1)

# Setando as mesmas observações iniciais para comparação
x2m[1] <- x2[1]
x2m[2] <- x2[2]

# Construção da Série manualmente
for(i in 3:N) 
  x2m[i] <- 0.4*x2m[i-1]-0.3*At[i-1]-0.8*At[i-2]+At[i]

par(mfrow = c(1,1)) # set up the graphics

ts.plot(x2m, main="Ex.3(c) - Generated Manually")

par(mfrow = c(2,1)) # set up the graphics

r.acf<-acf(x2m,type="correlation",plot=T,main="Ex.3(c) - Manually") 
ar.pacf<-acf(x2m,type="partial",plot=T,main="Ex.3(c) - Manually")

### Item (e)

x3 <- arima.sim(n=1000, list(ma=c(-1.8,0.72)), innov=At)

par(mfrow = c(1,1)) # set up the graphics

ts.plot(x3, main="Ex.3(e) - Generated by arima.sim()")

par(mfrow = c(2,1)) # set up the graphics
r.acf<-acf(x3,type="correlation",plot=T,main="Ex.3(e)") 
ar.pacf<-acf(x3,type="partial",plot=T,main="Ex.3(e)")

# ---- Simulando os passos para a construção do processo manualmente -----#

x3m <- ts(data=rep(0,N),start=1,end=N, frequency=1,delta=1)

# Setando as mesmas observações iniciais para comparação
x3m[1] <- x3[1]
x3m[2] <- x3[2]

# Construção da Série manualmente
for(i in 3:N) 
  x3m[i] <- -1.8*At[i-1]+0.72*At[i-2]+At[i]

par(mfrow = c(1,1)) # set up the graphics

ts.plot(x3m, main="Ex.3(e) - Generated Manually")

par(mfrow = c(2,1)) # set up the graphics

r.acf<-acf(x3m,type="correlation",plot=T,main="Ex.3(e) - Manually") 
ar.pacf<-acf(x3m,type="partial",plot=T,main="Ex.3(e) - Manually")

par(mfrow = c(1,1)) # Reset