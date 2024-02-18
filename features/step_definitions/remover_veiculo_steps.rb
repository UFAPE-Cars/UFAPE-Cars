Given('O veiculo com o modelo {string}, ano {string}, quilometragem {string}, uso {string}, historico de manutencao {string} e valor de anuncio {string} existe') do |modelo, ano, quilometragem, uso, historico_manutencao, valor_anuncio|
  visit '/veiculos/new'
  expect(page).to have_current_path('/veiculos/new')
  fill_in 'Modelo', with: modelo
  fill_in 'Ano', with: ano
  fill_in 'Quilometragem', with: quilometragem
  fill_in 'Uso', with: uso
  fill_in 'Historico manutencao', with: historico_manutencao
  fill_in 'Valor anuncio', with: valor_anuncio
  click_button 'Create Veiculo'
  expect(page).to have_content('Veiculo was successfully created.')
end

When('Eu clico em remover veiculo') do
  click_button 'Destroy this veiculo'
end

Then('Eu vejo uma mensagem de veiculo removido com sucesso') do
  expect(page).to have_content('Veiculo was successfully destroyed.')
end
