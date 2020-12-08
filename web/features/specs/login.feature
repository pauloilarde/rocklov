#language: pt

Funcionalidade: Login
    Sendo eu um usuário devidamente cadastrado
    Quero acessar o sistema RockLov
    Para anunciar meus equipamentos musicais para locação

    @login_sucesso
    Cenário: Login com sucesso

        Dado que eu acesso a página principal
        Quando submeto minhas credenciais "jon@email.com" e "pwd123"
        Então sou redirecionado para o dashboard

    @tentativa_login
    Esquema do Cenario: Tentar logar

        Dado que eu acesso a página principal
        Quando submeto minhas credenciais "<email_input>" e "<senha_input>"
        Então é exibida a mensagem: "<alerta_output>"

        Exemplos:
            | email_input       | senha_input | alerta_output                    |
            | paulo@exemplo.com | oi          | Usuário e/ou senha inválidos.    |
            | paulo@mail.dev    | pwd123      | Usuário e/ou senha inválidos.    |
            | paulo#mail.com    | pwd123      | Oops. Informe um email válido!   |
            |                   | pwd123      | Oops. Informe um email válido!   |
            | paulo@exemplo.com |             | Oops. Informe sua senha secreta! |

