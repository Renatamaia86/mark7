
Before do
    @login_page = LoginPage.new
    @navbar = Navbar.new
    @tarefas_page = TarefasPage.new
end



Before('@autenticado') do
    visit '/login'
    @login_page.logar('renata.mm86@gmail.com', '123456')
    @tarefas_page.wait_for_painel
end


After('@Logout') do
    @navbar.logout
end

After do |scenario|
   # nome_cenario = scenario.name.gsub(/)
    nome_cenario = scenario.name.tr(' ', '_').downcase!
    screenshot = "Log/screenshots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Evidência')

end

