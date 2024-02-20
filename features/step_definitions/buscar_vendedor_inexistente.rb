Given('que eu estou na página de busca de vendedores') do
  visit buscar_vendedors_path
end
When('eu busco um vendedor pelo CPF {string}') do |cpf|
  fill_in 'q', with: cpf
  click_button 'Buscar'
end
Then('o sistema não retorna nada') do

end
