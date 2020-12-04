Dado("que estou logado como {string} e {string}") do |email, password|
  visit "/"
  find("input[placeholder='Seu e-email']").set email
  find("input[type='password']").set password

  click_button "Entrar"
  sleep 3
end

Dado("que acesso a página de cadastro de anuncios") do
  click_button "Criar anúncio"
  expect(page).to have_css "#equipoForm"
  sleep 2
end

Dado("que eu possuo o seguinte equipamento") do |table|
  @anuncio = table.rows_hash
  Kernel.puts @anuncio
end

Quando("submeto o cadastro deste item") do
  image = Dir.pwd + "/features/support/fixtures/img/" + @anuncio[:thumb]
  find("#thumbnail input[type=file]", visible: false).set image
  find("input[placeholder$=equipamento]").set @anuncio[:nome]
  find("#category").find("option", text: @anuncio[:categoria]).select_option
  find("#price").set @anuncio[:preco]
  click_button "Cadastrar"
  sleep 3
end

Então("o produto deve ser exibido no dashboard") do
  anuncios = find(".equipo-list")
  expect(anuncios).to have_content @anuncio[:nome]
  expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end
