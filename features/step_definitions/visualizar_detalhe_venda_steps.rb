Given('vejo que existem vendas registradas no sistema') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  Veiculo.create!(modelo: "HB20", ano: "2022", quilometragem: 0, uso: "Novo", historico_manutencao: "...", valor_anuncio: 100, tabela_fipe: 110)
  Vendedor.create!(nome: "Felipe", cpf: "021.292.754-00", idade: 22, comissao: 0.5)
  Cliente.create!(email: "fabio.filho2001@hotmail.com", nome: "Fabio", telefone:"81993737193", cpf: "09104724402", idade: '22')
  @venda=Venda.create!(cliente: Cliente.first, veiculo: Veiculo.first, vendedor: Vendedor.first, valor: 95000.00, quantidade_veiculos: 1, status:'concluido')
end

When('eu seleciono uma venda especifica') do
  visit "/vendas/1"
  expect(page).to have_current_path('/vendas/1')
end

Then('eu devo ver os detalhes completos da venda') do
  expect(page).to have_content("Cliente: #{@venda.cliente.id}")
  expect(page).to have_content("Veiculo: #{@venda.veiculo.id}")
  expect(page).to have_content("Vendedor: #{@venda.vendedor.id}")
  expect(page).to have_content(/Valor: 95000\.0/)
  expect(page).to have_content("Quantidade veiculos: 1")
  expect(page).to have_content("Status: concluido")
end