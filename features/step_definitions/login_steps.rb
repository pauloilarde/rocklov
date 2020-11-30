Dado('que eu acesso a página principal') do                                   
    visit "http://rocklov-web:3000"
end                                                                           
                                                                                
Quando('submeto minhas credenciais {string} e {string}') do |email, senha| 
    find("input[placeholder='Seu e-email']").set email
    find("input[type='password']").set senha

    click_button "Entrar"
    sleep 2

end                                                                           