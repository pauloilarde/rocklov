#language: pt

Funcionalidade: cadastro de anúncios
    Sendo eu um usuário cadastrado no RockLov
    Quero cadastrar meus equipamentos
    Para disponibiliza-los para locação

    Contexto: Login
        * Fiz login como "neyma@psg.com" e "pwd123"

    @novo_equipo
    Cenario: novo equipo

            E que acesso a página de cadastro de anuncios
            E que eu possuo o seguinte equipamento
            | thumb     | violao-nylon.jpg |
            | nome      | Violão Tagima    |
            | categoria | Cordas           |
            | preco     | 90               |
        Quando submeto o cadastro deste item
        Então o produto deve ser exibido no dashboard
