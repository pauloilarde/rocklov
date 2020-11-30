Então('sou redirecionado para o dashboard') do
    Kernel.puts page
    expect(page).to have_css ".dashboard"
end
  