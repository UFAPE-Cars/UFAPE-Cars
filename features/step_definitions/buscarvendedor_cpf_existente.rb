Given('eu estou na página de busca de vendedores') do
  visit buscar_vendedors_path
end

When('busco um vendedor pelo CPF {string}') do |cpf|
  fill_in 'CPF', with: cpf
  click_button 'Buscar'
end

Then('o sistema retorna nenhum vendedor') do
  expect(page).not_to have_content('Detalhes do Vendedor')
end