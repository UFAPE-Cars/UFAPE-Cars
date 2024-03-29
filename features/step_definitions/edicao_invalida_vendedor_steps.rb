Given('O vendedor ja registrado de nome {string}, idade {string}, cpf {string}, comissao {string} existe') do |nome, idade, cpf, comissao|
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit '/vendedors/new'
  expect(page).to have_current_path('/vendedors/new')
  fill_in 'Nome', with: nome
  fill_in 'Idade', with: idade
  fill_in 'Cpf', with: cpf
  fill_in 'Comissao', with: comissao
  click_button 'Create Vendedor'
  expect(page).to have_content('Vendedor was successfully created.')
end

When('Eu clico no link de editar vendedor') do
  click_link 'Edit this vendedor'
end

And('Eu altero o campo de cpf para {string}') do |cpf|
  fill_in 'Cpf', with: cpf
end

And('Eu clico no devido botao para atualizar o vendedor') do
  click_button 'Update Vendedor'
end

Then('Eu vejo uma mensagem informando o erro ocorrido') do
  expect(page).to have_content('Cpf is invalid')
end