Given('que existem varias vendas registradas no sistema') do
  Veiculo.create!(modelo: "HB20", ano: "2022", quilometragem: 0, uso: "Novo", historico_manutencao: "...", valor_anuncio: 100, tabela_fipe: 110)
  Vendedor.create!(nome: "Felipe", cpf: "021.292.754-00", idade: 22, comissao: 0.5)
  Cliente.create!(email: "fabio.filho2001@hotmail.com", nome: "Fabio", telefone:"81993737193", cpf: "09104724402", idade: '22')
  Venda.create!(cliente: Cliente.first, veiculo: Veiculo.first, vendedor: Vendedor.first, valor: 95000.00, quantidade_veiculos: 1, status:'concluido')

  Veiculo.create!(modelo: "Onix", ano: "2021", quilometragem: 15000, uso: "Seminovo", historico_manutencao: "...", valor_anuncio: 80, tabela_fipe: 90)
  Vendedor.create!(nome: "Ana", cpf: "123.456.789-00", idade: 30, comissao: 0.4)
  Cliente.create!(email: "ana@email.com", nome: "Ana", telefone: "81987654321", cpf: "98765432109", idade: '30')
  Venda.create!(cliente: Cliente.second, veiculo: Veiculo.second, vendedor: Vendedor.second, valor: 80000.00, quantidade_veiculos: 2, status:'pendente')

  Veiculo.create!(modelo: "Civic", ano: "2020", quilometragem: 25000, uso: "Usado", historico_manutencao: "...", valor_anuncio: 120, tabela_fipe: 110)
  Vendedor.create!(nome: "Carlos", cpf: "987.654.321-00", idade: 35, comissao: 0.6)
  Cliente.create!(email: "carlos@email.com", nome: "Carlos", telefone: "81976543210", cpf: "76543210987", idade: '35')
  Venda.create!(cliente: Cliente.third, veiculo: Veiculo.third, vendedor: Vendedor.third, valor: 120000.00, quantidade_veiculos: 1, status:'cancelado')

end

When('eu visito a pagina de listagem de vendas') do
  visit '/vendas'
  expect(page).to have_current_path('/vendas')
end

Then('eu devo ver uma lista de todas as vendas com seus detalhes') do
  Venda.all.each do |venda|
    expect(page).to have_content("Cliente: #{venda.cliente.nome}")
    expect(page).to have_content("Veículo: #{venda.veiculo.modelo}")
    expect(page).to have_content("Vendedor: #{venda.vendedor.nome}")
    expect(page).to have_content("Valor: #{ActionController::Base.helpers.number_to_currency(venda.valor)}")
    expect(page).to have_content("Status: #{venda.status.capitalize}")
  end
end