

Dado('que eu acesso a página de cadastro') do
  visit "http://rocklov-web:3000/signup"
  
end

Quando('eu submeto o seguinte formulário de cadastro') do |table|            
  user = table.hashes.first

  MongoDB.new.remove_user(user[:email])
  
  find("#fullName").set user[:nome]
  find("#email").set user[:email]
  find("#password").set user[:senha]

  click_button "Cadastrar"
  sleep 2

end                                                                          
    
Então('sou redirecionado para o dashboard') do
  Kernel.puts page
  expect(page).to have_css ".dashboard"
end


Então('é exibida a mensagem: {string}') do |expected_alert|                           
  alert = find('.alert-dark')
  expect(alert.text).to eq expected_alert
end                                                                           