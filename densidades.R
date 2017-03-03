body <- "z + gamma(x1 + x2) * exp(x3+10) + sqrt(x1)"
args <- "z,x1=2,x2=3,x3=5"

sup = parse(text = paste(args, sep=','))
expression(args)

eval(parse(text = paste('f <- function(', args, ') { return(' , body , ')}', sep='')))
# Text it:
f(seq(0,1,len=10))

d=body; param = args; suporte=c(0,10)

# d = expressão da densidade
# param = parametros
# suporte = suporte (vetor com o máximo e mínimo a ser plotado)
genericDensity <- function(d, param, min, max, tam){
  eval(parse(text = paste('f <- function(', param, ') { return(' , d , ')}', sep='')))
  x = seq(min,max, len=tam) 
  valores = f(x)
  plot(x,valores, t='l', lwd=2, col="red", xlab="Suporte", ylab="Densidade")
  valores

}

# normal
body <- "1/(sigma*sqrt(2*pi)) * exp(-(x-mu)^2/(2*sigma^2))"
args <- "x, sigma=1, mu=0"
a = genericDensity(body,args,min=-1,max=1, tam=100)

# beta
body <- "(1-x)^(b-1)*x^(a-1)/beta(a,b)"
args <- "x, a=2, b=5"
b = genericDensity(body,args,min=0.01, max = 1, tam=100)

# gamma
body <- "alpha/gamma(r)*(alpha*x)^(r-1)*exp(-alpha*x)"
args <- "x, alpha=9, r=5"
c = genericDensity(body,args,min=0.01, max = 1, tam=100)

# exponencial
body <- "beta*exp(-x*beta)"
args <- "x, beta=1.5"
d = genericDensity(body,args,min=0.01, max = 10, tam=100)

# Weibull
body <- "(k/lambda)*(x/lambda)^(k-1)*exp(-(x/lambda)^k)"
args <- "x, lambda=2, k=5"
e = genericDensity(body,args,min=0.01, max = 10, tam=100)

# Lindley
body <- "(exp(-x*sigma)*(1+x)*sigma^2)/(1+sigma)"
args <- "x, sigma=0.4"
f = genericDensity(body,args,min=0.01, max = 10, tam=100)

