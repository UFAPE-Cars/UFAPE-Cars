Given('O veiculo ja registrado de modelo {string}, ano {string}, quilometragem {string}, uso {string}, historico de manutencao {string} e valor de anuncio {string} existe') do |modelo, ano, quilometragem, uso, historico_manutencao, valor_anuncio|
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

When('Eu clico no link de editar veiculo') do
  click_link 'Edit this veiculo'
end

When('Eu altero o valor da quilometragem para {string}') do |quilometragem|
  fill_in 'Quilometragem', with: quilometragem
end

When('Eu clico no devido botao para atualizar o veiculo') do
  click_button 'Update Veiculo'
end

Then('Eu vejo uma mensagem de erro') do
  assert_selector('div#motivo_erro', text: '')
end