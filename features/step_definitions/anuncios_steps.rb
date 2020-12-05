Dado("que estou logado como {string} e {string}") do |email, senha|
  @email = email

  login_page = LoginPage.new

  login_page.open_page
  login_page.with(email, senha)
end

Dado("que acesso a página de cadastro de anuncios") do
  click_button "Criar anúncio"
  expect(page).to have_css "#equipoForm"
end

Dado("que eu possuo o seguinte equipamento") do |table|
  @anuncio = table.rows_hash
  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro deste item") do
  image = Dir.pwd + "/features/support/fixtures/img/" + @anuncio[:thumb]
  find("#thumbnail input[type=file]", visible: false).set image
  find("input[placeholder$=equipamento]").set @anuncio[:nome]
  find("#category").find("option", text: @anuncio[:categoria]).select_option
  find("#price").set @anuncio[:preco]
  click_button "Cadastrar"
end

Então("o produto deve ser exibido no dashboard") do
  anuncios = find(".equipo-list")
  expect(anuncios).to have_content @anuncio[:nome]
  expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end
