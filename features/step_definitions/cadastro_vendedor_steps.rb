Given('Estou na pagina referente a registrar um vendedor com uma conta valida') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit '/vendedors/new'
  expect(page).to have_current_path('/vendedors/new')
end

When('Eu preencho os campos de registro com o nome {string}, idade {string}, cpf {string}, comissao {string}') do |nome, idade, cpf, comissao|
  fill_in 'Nome', with: nome
  fill_in 'Idade', with: idade
  fill_in 'Cpf', with: cpf
  fill_in 'Comissao', with: comissao
end

And('Eu clico no botao de registrar vendedor') do
  click_button 'Create Vendedor'
end

Then('Eu vejo uma mensagem de vendedor registrado') do
  expect(page).to have_content('Vendedor was successfully created.')
end
