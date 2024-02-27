Given('que eu estou na pagina de busca de vendedores') do
  visit buscar_vendedors_path
end
When('eu busco um vendedor pelo CPF {string}') do |cpf|
  fill_in 'q', with: cpf
  click_button 'Buscar'
end
Then('o sistema nao retorna nada') do

end
