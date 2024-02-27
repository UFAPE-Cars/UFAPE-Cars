Given('O vendedor de nome {string}, idade {string}, cpf {string}, comissao {string} existe') do |nome, idade, cpf, comissao|
  visit '/vendedors/new'
  expect(page).to have_current_path('/vendedors/new')
  fill_in 'Nome', with: nome
  fill_in 'Idade', with: idade
  fill_in 'Cpf', with: cpf
  fill_in 'Comissao', with: comissao
  click_button 'Create Vendedor'
  expect(page).to have_content('Vendedor was successfully created.')
end

When('Eu clico em editar vendedor') do
  click_link 'Edit this vendedor'
end

When('Eu altero a idade do vendedor para {int}') do |idade|
  fill_in 'Idade', with: idade
end

When('Eu clico no botao para atualizar o vendedor') do
  click_button 'Update Vendedor'
end

Then('Eu vejo uma mensagem de vendedor atualizado') do
  expect(page).to have_content('Vendedor was successfully updated.')
end