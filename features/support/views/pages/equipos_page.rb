class EquiposPage
  include Capybara::DSL

  def create(equipo)
    page.has_css?("#equipoForm")
    image = Dir.pwd + "/features/support/fixtures/img/" + equipo[:thumb]
    find("#thumbnail input[type=file]", visible: false).set image
    find("input[placeholder$=equipamento]").set equipo[:nome]
    find("#category").find("option", text: equipo[:categoria]).select_option
    find("#price").set equipo[:preco]
    click_button "Cadastrar"
  end
end
