#language: pt

Funcionalidade: cadastro de anúncios
    Sendo eu um usuário cadastrado no RockLov
    Quero cadastrar meus equipamentos
    Para disponibiliza-los para locação

    Contexto: Login
        * Fiz login como "neyma@psg.com" e "pwd123"

    @novo_equipo
    Cenario: novo equipo

        Dado que acesso a página de cadastro de anuncios
            E que eu possuo o seguinte equipamento
            | thumb     | violao-nylon.jpg |
            | nome      | Violão Tagima    |
            | categoria | Cordas           |
            | preco     | 90               |
        Quando submeto o cadastro deste item
        Então o produto deve ser exibido no dashboard

    @tentativa_cadastro
    Esquema do Cenario: Tentativa de cadastro de anúncios

        Dado que acesso a página de cadastro de anuncios
            E que eu possuo o seguinte equipamento
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro deste item
        Então é exibida a mensagem: "<saida>"

        Exemplos:
            | foto        | nome           | categoria | preco | saida                             |
            |             | Violão Gianini | Cordas    | 75    | Adicione uma foto no seu anúncio! |
            | amp.jpg     |                | Outros    | 350   | Informe a descrição do anúncio!   |
            | mic.jpg     | Microfone      |           | 220   | Informe a categoria               |
            | violino.jpg | Violino        | Cordas    |       | Informe o valor da diária         |
