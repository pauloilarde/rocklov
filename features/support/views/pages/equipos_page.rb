class EquiposPage
  include Capybara::DSL

  def create(equipo)
    page.has_css?("#equipoForm")
    upload(equipo[:thumb]) if equipo[:thumb].length > 0

    find("input[placeholder$=equipamento]").set equipo[:nome]
    find("#category").find("option", text: equipo[:categoria]).select_option
    find("#price").set equipo[:preco]
    click_button "Cadastrar"
  end

  def upload(file_name)
    image = Dir.pwd + "/features/support/fixtures/img/" + file_name
    find("#thumbnail input[type=file]", visible: false).set image
  end
end
