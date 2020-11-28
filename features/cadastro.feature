#language: pt
Funcionalidade: Cadastro
    Sendo eu um usuário que possui equipamentos musicais
    Quero fazer meu cadastro no RockLov
    Para disponibilizar meus equipamentos para locação

    @cadastro
    Cenario: fazer cadastro

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro completo
        Então sou redirecionado para o dashboard

    @tentativa_cadastro
    Cenario: submeter cadastro sem o nome

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro sem o nome 
        Então é exibida a mensagem: "Oops. Informe seu nome completo!"

    @tentativa_cadastro
    Cenario: submeter cadastro sem o email

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro sem o email
        Então é exibida a mensagem: "Oops. Informe um email válido!"

    @tentativa_cadastro
    Cenario: submeter cadastro com email incorreto

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro com email incorreto
        Então é exibida a mensagem: "Oops. Informe um email válido!"

    @tentativa_cadastro
    Cenario: submeter cadastro sem senha

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro sem a senha
        Então é exibida a mensagem: "Oops. Informe sua senha secreta!"


