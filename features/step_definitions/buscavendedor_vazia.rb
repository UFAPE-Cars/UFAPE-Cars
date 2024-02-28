Given('que eu estou na pagina de busca de vendedores') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit buscar_vendedors_path
end

When('eu realizo uma busca vazia') do
  fill_in 'q', with: ''
  click_button 'Buscar'
end

Then('o sistema mostra os vendedores disponiveis sem o resultado da busca feita') do

end
