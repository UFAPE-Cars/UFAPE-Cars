Given('Acesso a pagina de busca de veiculos') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit '/veiculos/buscar'
  expect(page).to have_current_path('/veiculos/buscar')
  Veiculo.create!(modelo: "Carro Teste", ano: "2021", quilometragem: 100, uso: "Novo", historico_manutencao: "...", valor_anuncio: 100, tabela_fipe: 110)
end

When('Eu preencho os campos com valor_minimo {float}, valor_maximo {float}') do |valor_minimo, valor_maximo|
  fill_in 'Valor mínimo', with: valor_minimo
  fill_in 'Valor máximo', with: valor_maximo
end

And('Eu seleciono o botao de busca') do
  click_button 'Buscar'
end

Then('Eu vejo um veiculo naquela faixa de preco') do
  expect(page).to have_content('Valor anuncio: R$ 100')
end