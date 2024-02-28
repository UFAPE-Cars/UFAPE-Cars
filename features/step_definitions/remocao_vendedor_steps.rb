Given('O vendedor com o nome {string}, idade {string}, cpf {string}, comissao {string} existe') do |nome, idade, cpf, comissao|
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

When('Eu clico em remover vendedor') do
  click_button 'Destroy this vendedor'
end

Then('Eu vejo uma mensagem de vendedor removido com sucesso') do
  expect(page).to have_content('Vendedor was successfully destroyed.')
end