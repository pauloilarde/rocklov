#language: pt
Funcionalidade: Cadastro
    Sendo eu um usuário que possui equipamentos musicais
    Quero fazer meu cadastro no RockLov
    Para disponibilizar meus equipamentos para locação

    @macgyver
    Cenario: fazer cadastro

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro completo
        Então sou redirecionado para o dashboard

    @sem_nome
    Cenario: submeter cadastro sem o nome

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro sem o nome 
        Então é exibida a mensagem: Oops. Informe seu nome completo! 

    Cenario: submeter cadastro sem o email

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro sem o email
        Então é exibida a mensagem: Oops. Informe um email válido!

    Cenario: submeter cadastro com email incorreto

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro com email incorreto
        Então é exibida a mensagem: Oops. Informe um email válido!

    Cenario: submeter cadastro sem senha

        Dado que eu acesso a página de cadastro
        Quando eu submeto meu cadastro sem a senha
        Então é exibida a mensagem: Oops. Informe sua senha secreta!


