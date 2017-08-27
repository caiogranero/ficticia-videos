# language: pt
Funcionalidade: Buscar vídeo
    
    Eu, como um cliente da equipe de Marketing do vagas.com
    Gostaria que fosse possível, carregar mais vídeos após já ter buscado por algum termo
    Para que tenha mais opções de escolhas
    
    Contexto: 
        Dado que eu acessei o site Ficticia Videos
        Então eu deveria ver a página "Vídeos em destaque"

    Cenário: Carregar mais vídeos
        Dado que eu clico no icone de lupa
        Então eu deveria ver um campo para digitar o que estiver buscando

        Dado que eu busco "vagas.com"
        Então eu deveria ver a página "Busca de vídeos" com 5 resultados

        Dado que eu clico em "Carregar mais vídeos..."
        Então eu deveria ver mais 5 resultados na página