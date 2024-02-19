Given('existe um vendedor com nome {string}, CPF {string}') do |nome, cpf|
  @vendedor = Vendedor.create!(nome: nome, cpf: cpf, idade: 22, comissao: 0.3)
end


When('eu busco o vendedor pelo nome {string}') do |nome|
  visit buscar_vendedors_path
  fill_in 'q', with: nome  # Assumindo que o campo de busca tem o id ou name 'q'
  click_button 'Buscar'
end

Then('devo visualizar o histórico de vendas do vendedor') do
  expect(page).to have_content('Ver Histórico de Vendas')
end
