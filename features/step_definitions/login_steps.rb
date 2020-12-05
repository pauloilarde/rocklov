Dado("que eu acesso a página principal") do
  visit "/"
end

Quando("submeto minhas credenciais {string} e {string}") do |email, senha|
  login_page = LoginPage.new
  login_page.campo_email.set email
  login_page.campo_senha.set senha
  login_page.botao_entrar
end
