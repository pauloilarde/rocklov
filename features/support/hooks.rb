Before do
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new
  @alert = Alert.new

  page.current_window.resize_to(1440, 900)
end
