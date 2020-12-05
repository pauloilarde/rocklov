Dado("que eu acesso a página de cadastro") do
  @signup_page.open
end

Quando("eu submeto o seguinte formulário de cadastro") do |table|
  user = table.hashes.first

  MongoDB.new.remove_user(user[:email])
  @signup_page.create(user)
end
