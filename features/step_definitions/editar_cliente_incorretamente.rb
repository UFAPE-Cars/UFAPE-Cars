Given('O cliente ja registrado de nome {string}, telefone {string}, email {string}, cpf {string}, idade {int} existe') do |nome, telefone, email, cpf, idade|
  visit '/clientes/new'
  expect(page).to have_current_path('/clientes/new')
  fill_in 'Nome', with: nome
  fill_in 'Telefone', with: telefone
  fill_in 'Email', with: email
  fill_in 'Cpf', with: cpf
  fill_in 'Idade', with: idade
  click_button 'Create Cliente'
  expect(page).to have_content('Cliente was successfully created.')
end

When('Eu clico no link de editar cliente') do
  click_link 'Edit this cliente'
end

When('Eu altero o campo do cpf para {string}') do |cpf|
  fill_in 'Cpf', with: cpf
end

When('Eu clico no devido botao para atualizar o cliente') do
  click_button 'Update Cliente'
end

Then('Eu vejo uma mensagem informando o erro') do
  expect(page).to have_content('Cpf is not a number')
end