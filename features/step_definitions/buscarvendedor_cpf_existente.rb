Given('existe um vendedor com nome {string}, CPF {string}') do |nome, cpf|
  Vendedor.create!(nome: nome, cpf: cpf, idade: 30, comissao: 0.5) # Ajuste conforme seu modelo
end

When('busco um vendedor pelo CPF {string}') do |cpf|
  fill_in 'CPF', with: cpf
  click_button 'Buscar'
end

Then('o sistema retorna os detalhes do vendedor {string}') do |nome_esperado|
  expect(page).to have_content(nome_esperado)
end