#language: pt
Funcionalidade: Cadastro
    Sendo eu um usuário que possui equipamentos musicais
    Quero fazer meu cadastro no RockLov
    Para disponibilizar meus equipamentos para locação

    @cadastro
    Cenario: fazer cadastro

        Dado que eu acesso a página de cadastro
        Quando eu submeto o seguinte formulário de cadastro
            | nome         | email           | senha  |
            | Paulo Ilarde | paulo@email.com | pwd123 |
        Então sou redirecionado para o dashboard

    @tentativa_cadastro
    Esquema do Cenario: tentativa de cadastro
        
        Dado que eu acesso a página de cadastro
        Quando eu submeto o seguinte formulário de cadastro
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então é exibida a mensagem: "<alerta_output>"

        Exemplos:
            | nome_input | email_input     | senha_input | alerta_output                    |
            |            | paulo@email.com | pwd123      | Oops. Informe seu nome completo! |
            | Paulo      |                 | pwd123      | Oops. Informe um email válido!   |
            | Paulo      | paulo*email.com | pwd123      | Oops. Informe um email válido!   |
            | Paulo      | paulo&email.com | pwd123      | Oops. Informe um email válido!   |
            | Paulo      | paulo@email.com |             | Oops. Informe sua senha secreta! |

