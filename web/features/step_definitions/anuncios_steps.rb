Dado("Fiz login como {string} e {string}") do |email, senha|
  @email = email

  @login_page.open_page
  @login_page.with(email, senha)
end

Dado("que acesso a página de cadastro de anuncios") do
  @dash_page.goto_equipo_form
end

Dado("que eu possuo o seguinte equipamento") do |table|
  @anuncio = table.rows_hash
  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro deste item") do
  @equipos_page.create(@anuncio)
end

Então("o produto deve ser exibido no dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end
