# Nome do Scrip: scriptProjeto.R
# Descrição: Cadastro de notas dos alunos
# Autor: Diogo José Pereira (diogo.jpereira@hotmail.com)
# Data de criação: 03/06/2021
# Descrição detalhada: Script contendo função para cadastro das notas em 03 avaliações
# e obtenção das médias dos alunos em classificação em aprovado ou reprovado e arquivado em dataframe.
# Exemplo de uso: exemplo(3)

exemplo <- function(num) {
  print("Esta função realiza as seguintes atividades:") 
  print("1º - cadastra alunos")
  print("2º - recebe suas notas")
  print("3º - mostra a média e diz se foi aprovado")
  print("Digite 1 para começar...")
  
  entrada<-scan(what="String",n=1)
  if (entrada!="1") {
    entrada<-"Fim do programa"
    return(entrada)
  }
  
  ## Setup dataframe
  Nomes<-as.character()
  Prova1<-as.numeric()
  Prova2<-as.numeric()
  Prova3<-as.numeric()
  MediaEscolar<-as.numeric()
  Situacao<-as.character()
  
  alunos<-data.frame(Nomes,Prova1,Prova2,Prova3,MediaEscolar,Situacao)
  alunos$Nomes<-Nomes
  alunos$Prova1<-Prova1
  alunos$Prova2<-Prova2
  alunos$Prova3<-Prova3
  alunos$MediaEscolar<-MediaEscolar
  alunos$Situacao<-Situacao
  
  saida<-1
  leitura<-1
  ## Interface com o Usuário
  while (TRUE) {
    ### Coleta de informações
    print("Nome:")
    nome<-scan(what="String",nmax = 1, sep = ";")
    print("Nota 1:")
    nota1<-scan(nmax = 1)
    print("Nota 2:")
    nota2<-scan(nmax = 1)
    print("Nota 3:")
    nota3<-scan(nmax = 1)
    media<-mean(c(nota1,nota2,nota3))
    
    ### Exibição das informações registradas
    cat("Nota na Prova 1 -->:",nota1,"\n")
    cat("Nota na Prova 2 -->:",nota2,"\n")
    cat("Nota na Prova 3 -->:",nota3,"\n")
    cat("Média do aluno:",media,"\n")
    
    #### Condicional para saber se aprovado ou reprovado
    if (media>=7) {
      passou<-"Aprovado"
    } else {
      passou<-"Reprovado"
    }
    cat("Aluno ",passou,"\n")
    ### Registro no Data Frame
    alunos[leitura,]<- c(nome, nota1, nota2, nota3, media, passou)
    leitura <- leitura + 1
    
    ### Sugestão de quebra do loop while
    print("Cadastrar outro aluno? Sim-> 1")
    saida <- scan(what="String",n=1)
    
    ### Condicional de saída
    if (saida!="1") {
      print("Obrigado")
      print("Banco de dados gerado...")
      return(alunos)
    }
      
  }
}