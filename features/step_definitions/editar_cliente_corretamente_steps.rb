Given('O cliente de nome {string}, telefone {string}, email {string}, cpf {string}, idade {int} existe') do |nome, telefone, email, cpf, idade|
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
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

When('Eu clico em editar cliente') do
  click_link 'Edit this cliente'
end

When('Eu altero a idade para {int}') do |idade|
  fill_in 'Idade', with: idade
end

When('Eu clico no botao para atualizar o cliente') do
  click_button 'Update Cliente'
end

Then('Eu vejo uma mensagem de cliente atualizado') do
  expect(page).to have_content('Cliente was successfully updated.')
end