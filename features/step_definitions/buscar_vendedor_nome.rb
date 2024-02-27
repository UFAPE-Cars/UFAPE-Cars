Given('existe um vendedor com nome {string}') do |nome|
  Vendedor.create!(nome: nome, cpf: "123.456.789-10", idade: 30, comissao: 0.5)
end

When('eu busco o vendedor pelo nome {string}') do |nome|
  visit buscar_vendedors_path
  fill_in 'q', with: nome
  click_button 'Buscar'
end

Then('devo visualizar o histórico de vendas do vendedor') do
  expect(page).to have_content('Ver Histórico de Vendas')
end
