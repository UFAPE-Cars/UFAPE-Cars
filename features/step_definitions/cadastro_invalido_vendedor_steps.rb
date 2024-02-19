Given('Estou na pagina referente ao de registrar um vendedor') do
  visit '/vendedors/new'
  expect(page).to have_current_path('/vendedors/new')
end

When('O vendedor com os campos de registro com nome {string}, idade {string}, cpf {string}, comissão {string}') do |nome, idade, cpf, comissao|
  fill_in 'Nome', with: nome
  fill_in 'Idade', with: idade
  fill_in 'Cpf', with: cpf
  fill_in 'Comissao', with: comissao
end

When('A seguir, eu clico no botao de registrar vendedor') do
  click_button 'Create Vendedor'
end

Then('Eu vejo uma mensagem de erro informando que o registro do vendedor falhou') do
  expect(page).to have_content('Cpf is invalid')
end