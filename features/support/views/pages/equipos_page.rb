class EquiposPage
  include Capybara::DSL

  def create(equipo)
    page.has_css?("#equipoForm")
    upload(equipo[:thumb]) if equipo[:thumb].length > 0

    find("input[placeholder$=equipamento]").set equipo[:nome]
    select_cat(equipo[:categoria]) if equipo[:categoria].length > 0

    find("#price").set equipo[:preco]
    click_button "Cadastrar"
  end

  def select_cat(cat)
    find("#category").find("option", text: cat).select_option
  end

  def upload(file_name)
    image = Dir.pwd + "/features/support/fixtures/img/" + file_name
    find("#thumbnail input[type=file]", visible: false).set image
  end
end
