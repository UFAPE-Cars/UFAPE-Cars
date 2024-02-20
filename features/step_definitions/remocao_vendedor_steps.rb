Given('O vendedor com o nome {string}, idade {string}, cpf {string}, comissão {string} existe') do |nome, idade, cpf, comissao|
  visit '/vendedors/new'
  expect(page).to have_current_path('/vendedors/new')
  fill_in 'Nome', with: nome
  fill_in 'Idade', with: idade
  fill_in 'Cpf', with: cpf
  fill_in 'Comissao', with: comissao
  click_button 'Create Vendedor'
  expect(page).to have_content('Vendedor was successfully created.')
end

When('Eu clico em remover vendedor') do
  click_button 'Destroy this vendedor'
end

Then('Eu vejo uma mensagem de vendedor removido com sucesso') do
  expect(page).to have_content('Vendedor was successfully destroyed.')
end