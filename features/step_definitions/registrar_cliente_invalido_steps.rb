Given('Estou na pagina referente ao de registrar um cliente') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit '/clientes/new'
  expect(page).to have_current_path('/clientes/new')
end

When('O cliente com os campos de registro com nome {string}, telefone {string}, email {string}, cpf {string}, idade {int} existe') do |nome, telefone, email, cpf, idade|
  fill_in 'Nome', with: nome
  fill_in 'Telefone', with: telefone
  fill_in 'Email', with: email
  fill_in 'Cpf', with: cpf
  fill_in 'Idade', with: idade

end

When('A seguir, eu clico no botao de registrar cliente') do
  click_button 'Create Cliente'
end

Then('Eu vejo uma mensagem de erro informando que o registro do cliente falhou') do
  expect(page).to have_content('Cpf is not a number')
end
