#language: pt

Funcionalidade: Login
    Sendo eu um usuário devidamente cadastrado
    Quero acessar o sistema RockLov
    Para anunciar meus equipamentos musicais para locação

    Cenário: Login com sucesso

        Dado que eu acesso a página principal
        Quando submeto minhas credenciais válidas
        Então sou redirecionado para o Dashboard

    Cenário: Senha incorreta

        Dado que eu acesso a página principal
        Quando submeto minhas credenciais com senha incorreta
        Então é exibida a mensagem de alerta: Usuário e/ou senha inválidos.

    Cenário: Email não cadastrado

        Dado que eu acesso a página principal
        Quando submeto minhas credenciais com email inexistente na RockLov
        Então é exibida a mensagem de alerta: Usuário e/ou senha inválidos.


    Cenário: Email incorreto

        Dado que eu acesso a página principal
        Quando submeto minhas credenciais
        Então é exibida a mensagem de alerta: Oops. Informe um email válido!

    Cenário: Email não informado

        Dado que eu acesso a página principal
        Quando submeto minhas credenciais sem preencher o campo email
        Então é exibida a mensagem de alerta: Oops. Informe um email válido!
