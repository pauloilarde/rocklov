
Dado('que eu acesso a página de cadastro') do
  visit "http://localhost:3000/signup"
  
end
  
Quando('eu submeto meu cadastro completo') do
  find("#fullName").set "Paulo"
  find("#email").set Faker::Internet.free_email
  find("#password").set "pwd123"

  click_button "Cadastrar"
  sleep 2
end
  
Então('sou redirecionado para o dashboard') do
  Kernel.puts page
  expect(page).to have_css ".dashboard"
end

Quando('eu submeto meu cadastro sem o nome') do                               
  find("#email").set Faker::Internet.free_email
  find("#password").set "pwd123"

  click_button "Cadastrar"
end

Então('é exibida a mensagem: Oops. Informe seu nome completo!') do            
  alert_missing_name = find(".alert-dark")
  expect(alert_missing_name.text).to eq 'Oops. Informe seu nome completo!'
end

Quando('eu submeto meu cadastro sem o email') do                               
  find("#fullName").set "Paulo"
  find("#password").set "pwd123"

  click_button "Cadastrar"
  
end

Quando('eu submeto meu cadastro com email incorreto') do                     
  find("#fullName").set "Paulo"
  find("#email").set "ola"
  find("#password").set "pwd123"

  click_button "Cadastrar"

end                                                                          

Então('é exibida a mensagem: Oops. Informe um email válido!') do               
  alert_missing_email = find(".alert-dark")
  expect(alert_missing_email.text).to eq 'Oops. Informe um email válido!'
end                                                                            
                                                                               