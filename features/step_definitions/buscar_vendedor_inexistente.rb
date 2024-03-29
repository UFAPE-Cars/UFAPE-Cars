Given('que eu entro na pagina de busca de vendedores') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit buscar_vendedors_path
end
When('eu busco um vendedor pelo CPF {string}') do |cpf|
  fill_in 'q', with: cpf
  click_button 'Buscar'
end
Then('o sistema mostra uma mensagem informando que nao existe aquele vendedor cadastrado') do
  expect(page).not_to have_content('Show this vendedor')
  expect(page).to have_content('Nenhum vendedor encontrado')
end
