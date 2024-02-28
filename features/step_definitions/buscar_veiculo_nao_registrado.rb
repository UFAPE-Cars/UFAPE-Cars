Given('Chego na pagina de busca de veiculos') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit '/veiculos/buscar'
  expect(page).to have_current_path('/veiculos/buscar')
end

When('Eu preencho os campos com valor_maximo {float}, valor_minimo {float}') do |valor_maximo, valor_minimo|
  fill_in 'Valor mínimo', with: valor_minimo
  fill_in 'Valor máximo', with: valor_maximo
end

And('Eu clico no botao de busca') do
  click_button 'Buscar'
end

Then('Eu vejo uma mensagem informando que nao existe veiculos com aquelas caracteristicas') do
  expect(page).to have_content('Nenhum veiculo encontrado')
end