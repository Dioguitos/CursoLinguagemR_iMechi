Exercicios Práticos do curso
================

## Aplicação prática 1

### QUESTÃO 1

Imagine que você vai precisar criar um algoritmo em R para esta
instituição financeira, tal que ele avalie cada novo cliente que
solicita o crédito. Neste caso, você concorda que o primeiro passo a
fazer será coletar informações do cliente? Se não, o que você sugere?

``` r
# Acredito que o melhor é avaliar as condições e definir bem o escopo.
# Entender coisas como se tenho a tecnologia necessária para a análise( necessário comprar algum hardware ou licença)
# se vou ter disponíveis as informações mínimas e prazo de execução.
# A partir daí posso partir para uma abstração minima que sugira quais informações do cliente final vamos usar.
```

## Aplicação prática 2

### QUESTÃO 1

Crie um vetor que receba os nomes de cada cliente. Para padronizarmos,
imagine que a instituição financeira recebeu 4 clientes: Marcos de
Aguiar, Paula Miranda, Emilio Santos, Priscila de Albuquerque.

``` r
# 1. Cadastro de nomes
## clientes <- scan(what = "String", sep = ";") *forma a se aplicar em um script
clientes <- c("Marcos de Aguiar", "Paula Miranda", "Emilio Santos", "Priscila de Albuquerque")
```

### QUESTÃO 2

Ocorreu que a cliente Priscila de Albuquerque acaba de informar que o
seu nome foi escrito de forma incorreta. O correto seria Pryscilla de
Albuquerque. Descreva como você irá corrigir isto.

``` r
# 2. Atualização no cadastro
expand.grid(clientes) # Descubrindo o índice da alteração
```

    ##                      Var1
    ## 1        Marcos de Aguiar
    ## 2           Paula Miranda
    ## 3           Emilio Santos
    ## 4 Priscila de Albuquerque

``` r
clientes[4] <- "Pryscilla de Albuquerque" # corrigindo o cadastro do nome

clientes # conferindo resultado
```

    ## [1] "Marcos de Aguiar"         "Paula Miranda"           
    ## [3] "Emilio Santos"            "Pryscilla de Albuquerque"

### QUESTÃO 3

Com base nas informações sobre os salários de cada cliente que solicita
o empréstimo, crie um vetor que receba estes salários. Use as
informações a seguir fornecidas no cadastro:  
- Marcos de Aguiar: R$ 4.000  
- Paula Miranda: R$ 2.500  
- Emilio Santos: R$ 1.200  
- Priscila de Albuquerque: R$3.400

``` r
# 3. Cadastro de salários
# salarios <- scan() *forma a se aplicar em um script
salarios <- c(4000, 2500, 1200, 3400)
```

### QUESTÃO 4

Sabendo que os salários informados são os brutos e não os líquidos,
imagine que após retirar os impostos e gastos básicos, cada indivíduo
perde 30% deste salário originalmente informado. Como atualizar isto?

``` r
# 4. Atualizar o vetor salários para salários liquido (%30 a menos)
salarios <- salarios * (1 - 0.3)
```

## Aplicação prática 3

### QUESTÃO 1

Imagine que após receber 100 pedidos de empréstimos, apenas 30
informaram receber mais de 10 salários mínimos. Imagine que você
trabalha na instituição financeira e deseja escolher aleatoriamente 5
diferentes clientes a partir destes 30 para oferecer um empréstimo
adicional. Como você faria isto?

``` r
# 1. Gerando IDs aleatórios dos clientes, de 1 a 30 sem repetição
sample(1:30,5,replace = FALSE)
```

    ## [1] 23  5 14 18  7

## Aplicação prática 4

### QUESTÃO 1

Com as informações abaixo, crie uma matriz de 4 linhas e 3 colunas:  
Pedidos de Empréstimos  
……  
Nome do Cliente: Marcos de Aguiar  
Salário informado: R$ 4.000  
Idade: 44 anos  
……  
Nome do Cliente: Paula Miranda  
Salário informado: R$ 2.500  
Idade: 56 anos  
……  
Nome do Cliente: Emilio Santos  
Salário informado: R$ 1.200  
Idade: 76 anos  
……  
Nome do Cliente: Pryscilla de Albuquerque  
Salário informado: R$ 3.400  
Idade: 40 anos  
……

``` r
# 1. Cadastro das matrizes
## cadastro dos vetores
clientes <- c("Marcos de Aguiar", "Paula Miranda", "Emilio Santos", "Pryscilla de Albuquerque")
salarios <- c(4000, 2500, 1200, 3400)
idade <- c(44, 56, 76, 40)

## montagem dos vetores nas matrizes
pedidosEmprestimos<- cbind(clientes, salarios, idade)
```

### QUESTÃO 2

Suponha que ocorreu um erro ocorreu no cadastro da cliente Paula Miranda
e na verdade seu salário é de R$ 5.500,33 e não R$ 2.500 como informado
inicialmente. Faça esta modificação na matriz.

``` r
# 2. Correção no cadastro da Paula Miranda
pedidosEmprestimos[match("Paula Miranda", pedidosEmprestimos),2] <- 5500.33
```

### QUESTÃO 3

Na hora de conceder crédito para um cliente, a instituição financeira
tem maior interesse no seu salário líquido, pois reflete o quanto de
renda ainda não está comprometida antes de solicitar o empréstimo. Então
substitua a informação do salário bruto pelo salário líquido, supondo
que os impostos e outras taxas consomem 30% da sua renda.

Obs: perceba que esta os valores de salários estão como strings, então
você precisará transformá-los em informação numérica. Para isto, aplique
a função as.numeric() sobre a coluna de salários.

``` r
# 3. Atualização no salários para os valores de salário bruto (30% a menos)
salarios <- as.numeric(pedidosEmprestimos[,2])*(1-0.3)
pedidosEmprestimos[,2] <- salarios
```

### QUESTÃO 4

Por razões adminstrativas, a instituição deseja obter a média salarial
dos clientes com base no salário líquido (após a dedução de 30%).
Descreva como obter esta informação.

Obs: considere aplicar novamente a função as.numeric()

``` r
# 4. Descobrindo a média salarial dos clientes
mean(as.numeric(pedidosEmprestimos[,2]))
```

    ## [1] 2467.558

### QUESTÃO 5

Usando a função colnames() refedina os nomes das colunas fazendo com que
todos iniciem com letra maiúsculas.

``` r
# 5. Mudando os nomes das colunas da matriz
colnames(pedidosEmprestimos) <- c("Clientes", "Salarios", "Idade")

## Visualizando resultado
pedidosEmprestimos
```

    ##      Clientes                   Salarios   Idade
    ## [1,] "Marcos de Aguiar"         "2800"     "44" 
    ## [2,] "Paula Miranda"            "3850.231" "56" 
    ## [3,] "Emilio Santos"            "840"      "76" 
    ## [4,] "Pryscilla de Albuquerque" "2380"     "40"

## Aplicação prática 5

### QUESTÃO 1

Ao final de cada dia o gestor da instituição financeira solicita que
você analise os pedidos de empréstimos capiturados por três
funcionários, onde cada um recebe diferentes clientes.

Para isto construa um array contendo três matrizes contendo apenas
zeros. Cada uma destas matrizes deverá conter **4 linhas** (onde cada
linha refere-se a um cliente) e **5 colunas** (Nome, Salário, Idade,
Motivo do Empréstimo, Valor Solicitado).

``` r
# 1.Criando o Array inicial com 3 Matrizes zeradas de 4 Linhas, 5 Colunas
fimDia<-array(0, dim = c(4,5,3))
```

### QUESTÃO 2

Cada uma destas três matrizes refere-se ao dia de trabalho (desempenho)
de cada um dos três funcionários, então:  
- Nomeie cada matriz com os respectivos nomes de cada funcionário.  
Funcionário 1 - Melissa M.  
Funcionário 2 - Carlos P.  
Funcionário 3 - Luciana T.  
- Nomeie cada coluna como sendo: Nome, Salário, Idade, Motivo do
Empréstimo e Valor Solicitado. - Nomeie cada linha como sendo Cliente 1,
Cliente 2, Cliente 3 e Cliente 4.

``` r
# 2.Atribuindo nomes as linhas, colunas e matrizes
nomeColunas<-c("Nome","Salário","Idade","Motivo do Emprestimo","Valor Solicitado")
nomeLinhas<-c("Cliente 1","Cliente 2","Cliente 3","Cliente 4")
nomeMatriz<-c("Melissa M.","Carlos P.","Luciana T.")
dimnames(fimDia) <- list(nomeLinhas,nomeColunas,nomeMatriz)
```

### QUESTÃO 3

Use as informações a seguir para preencher o Array criado anteriormente.

``` r
## Dados do enunciado
funcionario1<-cbind(Nome=c("Marcos","Paulo","João","Kamila"),
                    Salario=c(4000,3000,4500,2300),
                    Idade=c(45,33,36,45),
                    Motivo=c("Compra de Carro","Reforma da Casa","Viagem","Compra de Casa"),
                    Valor.Pedido=c(45000,34000,20000,120000))
funcionario2<-cbind(Nome=c("Marcela","Fábio","Luana","Romero"),
                    Salario=c(3200,4500,2500,1300),
                    Idade=c(34,30,56,54),
                    Motivo=c("Compra de Carro","Viagem","Viagem","Compra de Carro"),
                    Valor.Pedido=c(75000,55000,19000,90000))
funcionario3<-cbind(Nome=c("Gustavo","Bruno","Joana","Vânia"),
                    Salario=c(11000,5600,1580,6300),
                    Idade=c(56,29,44,57),
                    Motivo=c("Compra de Casa","Viagem","Compra de Apartamento","Reforma da Casa"),
                    Valor.Pedido=c(55000,8000,21000,7000))

# 3.Gerando os valores e preenchendo os arrays
fimDia<-array(c(funcionario1,funcionario2,funcionario3), dim = c(4,5,3), dimnames = list(nomeLinhas,nomeColunas,nomeMatriz))
```

### QUESTÃO 4

Suponha que cada funcionário receberá uma comissão baseada no valor do
crédito disponibilizado. Sendo assim, use seu conhecimento em acessar as
informações do array para decidir qual funcionário ficará mais alegre.

``` r
# 4.Consultando o credito oferecido por cada vendedor
## funcionario1 = Melissa M.
sum(as.numeric(fimDia[,5,1]))
```

    ## [1] 219000

``` r
## funcionario2 = Carlos P.
sum(as.numeric(fimDia[,5,2]))
```

    ## [1] 239000

``` r
## funcionario3 = Luciana T.
sum(as.numeric(fimDia[,5,3]))
```

    ## [1] 91000

## Aplicação prática 6

### QUESTÃO 1

Ainda em relação a aplicação da instituição financeira “X”, imagine que
por razões administrativas os resultados das petições de empréstimos
foram:

#### Funcionario 1:

-   Marcos: Aprovado  
-   Paulo: Reprovado  
-   João: Reprovado  
-   Kamila: Reprovado

#### Funcionario 2:

-   Marcela: Reprovado  
-   Fábio: Aprovado  
-   Luana: Reprovado  
-   Romero: Reprovado

#### Funcionario 3:

-   Gustavo: Aprovado  
-   Bruno: Reprovado  
-   Joana: Aprovado  
-   Vânia: Aprovado

Crie um fator que guarde o resultado destes pedidos de empréstimos.

``` r
# 1. Criando os fatores
funcionario1<-factor(c("1","0","0","0"))
funcionario2<-factor(c("0","1","0","0"))
funcionario3<-factor(c("1","0","1","1"))
levels(funcionario1)<-c("Reprovado","Aprovado")
levels(funcionario2)<-c("Reprovado","Aprovado")
levels(funcionario3)<-c("Reprovado","Aprovado")
```

## Aplicação prática 7

### QUESTÃO 1

Com base no array “desempenho” criado anteriormente, imagine que a
instituição financeira escolhe 3 clientes para receberem um empréstimo
ainda maior do que pediram. Estes clientes foram: Marcos, Paulo, João.

Crie uma lista para cada um deles. Cada lista deve conter o nome,
salário, Histórico de Gastos no Cartão de Crédito e a Idade.

Abaixo as informações dos históricos das faturas do cartão de crédito:

Marcos: R$334 R$356 R$544  
Paulo: R$230 R$280 R$399  
João: R$120 R$255 R$270

``` r
# 1. Criar uma lista contendo(Nome, Salário, Histórico, Idade)
## Lista para os clientes Marcos, Paulo e João (Matriz Melsissa M.)

## Cadastrando histórico dos Gastos em um vetor
HistGastos1<-c(334,356,544)
HistGastos2<-c(230,280,399)
HistGastos3<-c(120,255,270)

## Separando as Informações do Array
fimDia[1:3,c(1,2,3),"Melissa M."]
```

    ##           Nome     Salário Idade
    ## Cliente 1 "Marcos" "4000"  "45" 
    ## Cliente 2 "Paulo"  "3000"  "33" 
    ## Cliente 3 "João"   "4500"  "36"

``` r
## Preparando os valores para montagem da lista
NomeCliente1<-fimDia[1,1,"Melissa M."]
NomeCliente2<-fimDia[2,1,"Melissa M."]
NomeCliente3<-fimDia[3,1,"Melissa M."]
SalarioCliente1<-as.numeric(fimDia[1,2,"Melissa M."])
SalarioCliente2<-as.numeric(fimDia[2,2,"Melissa M."])
SalarioCliente3<-as.numeric(fimDia[3,2,"Melissa M."])
IdadeCliente1<-as.numeric(fimDia[1,3,"Melissa M."])
IdadeCliente2<-as.numeric(fimDia[2,3,"Melissa M."])
IdadeCliente3<-as.numeric(fimDia[3,3,"Melissa M."])

## Montagem da lista de cada Cliente
cliente1<-list(Nome=NomeCliente1,Salario=SalarioCliente1,HistGastos=HistGastos1,Idade=IdadeCliente1)
cliente2<-list(Nome=NomeCliente2,Salario=SalarioCliente2,HistGastos=HistGastos2,Idade=IdadeCliente2)
cliente3<-list(Nome=NomeCliente3,Salario=SalarioCliente3,HistGastos=HistGastos3,Idade=IdadeCliente3)
```

### QUESTÃO 2

Agora a instituição financeira deseja obter destes três clientes, as
médias dos últimos gastos do cartão de crédito.

``` r
# 2. Descobrindo a média de cada cliente
## Consulta simples
mean(cliente1$HistGastos)
```

    ## [1] 411.3333

``` r
mean(cliente2$HistGastos)
```

    ## [1] 303

``` r
mean(cliente3$HistGastos)
```

    ## [1] 215

``` r
## Acrescentando resultado na lista
cliente1[[5]] <- mean(cliente1$HistGastos)
cliente2[[5]] <- mean(cliente2$HistGastos)
cliente3[[5]] <- mean(cliente3$HistGastos)
names(cliente1)[5] <- "Média_gastos"
names(cliente2)[5] <- "Média_gastos"
names(cliente3)[5] <- "Média_gastos"

## Consulta dos cadastros
cliente1
```

    ## $Nome
    ## [1] "Marcos"
    ## 
    ## $Salario
    ## [1] 4000
    ## 
    ## $HistGastos
    ## [1] 334 356 544
    ## 
    ## $Idade
    ## [1] 45
    ## 
    ## $Média_gastos
    ## [1] 411.3333

``` r
cliente2
```

    ## $Nome
    ## [1] "Paulo"
    ## 
    ## $Salario
    ## [1] 3000
    ## 
    ## $HistGastos
    ## [1] 230 280 399
    ## 
    ## $Idade
    ## [1] 33
    ## 
    ## $Média_gastos
    ## [1] 303

``` r
cliente3
```

    ## $Nome
    ## [1] "João"
    ## 
    ## $Salario
    ## [1] 4500
    ## 
    ## $HistGastos
    ## [1] 120 255 270
    ## 
    ## $Idade
    ## [1] 36
    ## 
    ## $Média_gastos
    ## [1] 215

## Aplicação prática 8

### QUESTÃO 1

Digamos que o gestor da instituição financeira não ficou satisfeito com
a “aparência” do array então solicitou que você construa uma única
tabela que mostre o desempenho de todos os funcionários.

Obs: usando as informações do array “desempenho” criado anteriormente,
construa um Data Frame onde o desempenho dos três funcionários possa ser
visto em uma única tabela.

``` r
# 1. dataframe de desempenho
## Criando uma matriz vazia para receber os dados do Array
teste<-matrix(nrow = 12,ncol = 5)
teste[1:4,1:5]<-fimDia[,,"Melissa M."]
teste[5:8,1:5]<-fimDia[,,"Carlos P."]
teste[9:12,1:5]<-fimDia[,,"Luciana T."]
## Criação do Data Frame
tabelaDesempenho<-data.frame(teste)
```

### QUESTÃO 2

A instituição financeira está com problemas de entender o nome das
linhas da tabela criada. Então para simplificar a vizualização use a
função rownames() para substituir os nomes das linhas atuais para uma
sequência numérica de 1 a 12.

``` r
# 2. Correção do nome das colunas no meu caso
names(tabelaDesempenho)<-c("Nome","Salário","Idade","MotivoEmprestimo","ValorSolicitado")
```

### QUESTÃO 3

A instituição financeira precisa usar os números mostrados para os
Salários, Idade e Valor Solicitado para incluir em um modelo e por fim
dar uma resposta sobre a aprovação ou reprovação do crédito.

Suponha que neste momento outro analista cuide do modelo, mas sua missão
será preparar os dados para ele.

Obs: usando a função str() você vai perceber que as variáveis Salário,
Idade e Valor Solicitado estão como fatores, mas na verdade precisam
estar como numéricas para que se possa fazer cálculos com elas.

Então para isto você precisará atualizar as variáveis, definindo
corretamente o que é fator e o que é variável numérica.

``` r
# 3. Tratamento dos dados numéricos
tabelaDesempenho[,c(3)]<-as.numeric(tabelaDesempenho[,c(3)])
tabelaDesempenho[,c(5)]<-as.numeric(tabelaDesempenho[,c(5)])
tabelaDesempenho[,c(2)]<-as.numeric(tabelaDesempenho[,c(2)])

## Teste do resultado
str(tabelaDesempenho)
```

    ## 'data.frame':    12 obs. of  5 variables:
    ##  $ Nome            : chr  "Marcos" "Paulo" "João" "Kamila" ...
    ##  $ Salário         : num  4000 3000 4500 2300 3200 4500 2500 1300 11000 5600 ...
    ##  $ Idade           : num  45 33 36 45 34 30 56 54 56 29 ...
    ##  $ MotivoEmprestimo: chr  "Compra de Carro" "Reforma da Casa" "Viagem" "Compra de Casa" ...
    ##  $ ValorSolicitado : num  45000 34000 20000 120000 75000 55000 19000 90000 55000 8000 ...

### QUESTÃO 4

A instituição financeira precisa entender o desempenho de cada
funcionário de forma separada, mas sem precisar criar uma outra tabela.

Obs: aqui é uma boa oportunidade para você criar um filtro com base no
data frame. Para isto você precisa:  
a - Criar uma nova variável que será um fator contendo os nomes dos
funcionários. Use a função gl().  
b - Adicione esta nova variável ao banco de dados.  
c - Utilize os conhecimentos sobre acessar os elementos do data frame
para que seja mostrado apenas as informações por funcionário.

``` r
# 4. Criação automatica de Fatores, inserindo informação dos vendedores em nova coluna
tabelaDesempenho[,6]<-gl(3,4,labels = c("Melissa M.","Carlos P.","Luciana T."))
## Correção do nome do ultimo elemento, já que acrescentamos nova coluna
names(tabelaDesempenho)<-c("Nome","Salário","Idade","MotivoEmprestimo","ValorSolicitado","Vendedor")

## Registro do intervalo de amostras referênte a cada vendedor
vendedor1<-1:4
vendedor2<-5:8
vendedor3<-9:12

## Consulta simplificada pelo conceito das amostras
tabelaDesempenho[vendedor1,]
```

    ##     Nome Salário Idade MotivoEmprestimo ValorSolicitado   Vendedor
    ## 1 Marcos    4000    45  Compra de Carro           45000 Melissa M.
    ## 2  Paulo    3000    33  Reforma da Casa           34000 Melissa M.
    ## 3   João    4500    36           Viagem           20000 Melissa M.
    ## 4 Kamila    2300    45   Compra de Casa          120000 Melissa M.

``` r
tabelaDesempenho[vendedor2,]
```

    ##      Nome Salário Idade MotivoEmprestimo ValorSolicitado  Vendedor
    ## 5 Marcela    3200    34  Compra de Carro           75000 Carlos P.
    ## 6   Fábio    4500    30           Viagem           55000 Carlos P.
    ## 7   Luana    2500    56           Viagem           19000 Carlos P.
    ## 8  Romero    1300    54  Compra de Carro           90000 Carlos P.

``` r
tabelaDesempenho[vendedor3,]
```

    ##       Nome Salário Idade      MotivoEmprestimo ValorSolicitado   Vendedor
    ## 9  Gustavo   11000    56        Compra de Casa           55000 Luciana T.
    ## 10   Bruno    5600    29                Viagem            8000 Luciana T.
    ## 11   Joana    1580    44 Compra de Apartamento           21000 Luciana T.
    ## 12   Vânia    6300    57       Reforma da Casa            7000 Luciana T.

### QUESTÃO 5

A instituição financeira quer entender o principal motivo do pedido de
empréstimo por estes clientes.  
Então para isto…  
a) Aplique a função table() sobre a variável que guarda os motivos.  
b) Aplique a função pie() sobre a tabela criada no item acima para ver o
gráfico de pizza.  
c) Aplique a função barplot() sobre a tabela criada no item “a)” para
ver o gráfico de barras.

``` r
# 5. Montagem da tabela de motivos e representações em gráficos
table(tabelaDesempenho$MotivoEmprestimo)
```

    ## 
    ## Compra de Apartamento       Compra de Carro        Compra de Casa 
    ##                     1                     3                     2 
    ##       Reforma da Casa                Viagem 
    ##                     2                     4

``` r
pie(table(tabelaDesempenho$MotivoEmprestimo))
```

![](aplicacaoPratica_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

``` r
barplot(table(tabelaDesempenho$MotivoEmprestimo))
```

![](aplicacaoPratica_files/figure-gfm/unnamed-chunk-23-2.png)<!-- -->
