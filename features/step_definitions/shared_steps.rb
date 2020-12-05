Então("sou redirecionado para o dashboard") do
  expect(@dash_page.on_dash?).to be true
end

Então("é exibida a mensagem: {string}") do |expected_alert|
  alert = find(".alert-dark")
  expect(@alert.dark).to include expected_alert
end
