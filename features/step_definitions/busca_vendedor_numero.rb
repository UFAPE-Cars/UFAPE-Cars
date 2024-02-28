Given('que eu vou para a pagina de busca de vendedores') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit buscar_vendedors_path
end
When('eu busco o vendedor pelo numero {string}') do |numero|
  fill_in 'q', with: numero
  click_button 'Buscar'
end
When('eu busco o vendedor pelo numero de busca {string}') do |numero|
  visit buscar_vendedors_path
  fill_in 'q', with: numero
  click_button 'Buscar'
end
Then('o sistema mostra uma mensagem informando que nao encontrou nenhum vendedor') do
  expect(page).to have_content('Nenhum vendedor encontrado')
end
