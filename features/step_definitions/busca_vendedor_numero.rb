When('eu busco o vendedor pelo numero {string}') do |numero|
  visit buscar_vendedors_path
  fill_in 'q', with: numero
  click_button 'Buscar'
end
When('eu busco o vendedor pelo numero de busca {string}') do |numero|
  visit buscar_vendedors_path
  fill_in 'q', with: numero
  click_button 'Buscar'
end
Then('o sistema mostra uma mensagem informando que nao encontrou nenhum vendedor') do
  expect(page).to have_content('Nenhum vendedor encontrado')
end
