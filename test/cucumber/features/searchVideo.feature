# language: pt
Funcionalidade: Buscar vídeo
    
    Eu, como um cliente da equipe de Marketing do vagas.com
    Gostaria que fosse possível encontrar um vídeo específico
    Para poder assistir o que mais me agradar
    
    Contexto: 
        Dado que eu acessei o site Ficticia Videos
        Então eu deveria ver a página "Vídeos em destaque"

    Cenário: Encontrar um vídeo especifíco
        Dado que eu clico no icone de lupa
        Então eu deveria ver um campo para digitar o que estiver buscando

        Dado que eu busco "vagas.com"
        Então eu deveria ver a página "Busca de vídeos" com 5 resultados