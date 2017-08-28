# language: pt
Funcionalidade: Buscar vídeo
    
    Eu, como um cliente da equipe de Marketing do vagas.com
    Gostaria que fosse possível, após encontrar um vídeo, visualizar ele
    Para poder assistir o que eu escolher
    
    Contexto: 
        Dado que eu acessei o site Ficticia Videos
        Então eu deveria ver a página "Vídeos em destaque"

    Cenário: Assistir um vídeo buscado
        Dado que eu clico no icone de lupa
        Então eu deveria ver um campo para digitar o que estiver buscando

        Dado que eu busco "vagas.com"
        Então eu deveria ver a página "Busca de vídeos" com 5 resultados

        Dado que eu clico em um vídeo após a busca
        Então eu deveria ver um modal com o video e a descrição dele