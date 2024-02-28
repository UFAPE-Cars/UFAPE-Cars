Given('Estou na pagina de registrar um cliente') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit '/clientes/new'
  expect(page).to have_current_path('/clientes/new')
end

When('Eu preencho os campos de registro com nome {string}, telefone {string}, email {string}, cpf {string}, idade {int}') do |nome, telefone, email, cpf, idade|
  fill_in 'Nome', with: nome
  fill_in 'Telefone', with: telefone
  fill_in 'Email', with: email
  fill_in 'Cpf', with: cpf
  fill_in 'Idade', with: idade

end

And('Eu clico no botao de registrar cliente') do
  click_button 'Create Cliente'
end

Then('Eu vejo uma mensagem de cliente registrado') do
  expect(page).to have_content('Cliente was successfully created.')
end
