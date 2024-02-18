Given('Estou na pagina de registrar um veiculo') do
  visit '/veiculos/new'
  expect(page).to have_current_path('/veiculos/new')
end

When('Eu preencho os campos de registro com modelo {string}, ano {string}, quilometragem {string}, uso {string}, historico de manutencao {string} e valor de anuncio {string}') do |modelo, ano, quilometragem, uso, historico_manutencao, valor_anuncio|
  fill_in 'Modelo', with: modelo
  fill_in 'Ano', with: ano
  fill_in 'Quilometragem', with: quilometragem
  fill_in 'Uso', with: uso
  fill_in 'Historico manutencao', with: historico_manutencao
  fill_in 'Valor anuncio', with: valor_anuncio
end

And('Eu clico no botao de registrar veiculo') do
  click_button 'Create Veiculo'
end

Then('Eu vejo uma mensagem de veiculo registrado') do
  expect(page).to have_content('Veiculo was successfully created.')
end
