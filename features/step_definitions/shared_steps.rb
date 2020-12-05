Então("sou redirecionado para o dashboard") do
  Kernel.puts page
  expect(page).to have_css ".dashboard"
end

Então("é exibida a mensagem: {string}") do |expected_alert|
  alert = find(".alert-dark")
  expect(@alert.dark).to eq expected_alert
end
