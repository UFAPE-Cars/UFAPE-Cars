Given('eu estou na pagina de detalhes da venda') do
  Veiculo.create!(modelo: "HB20", ano: "2022", quilometragem: 0, uso: "Novo", historico_manutencao: "...", valor_anuncio: 100, tabela_fipe: 110)
  Vendedor.create!(nome: "Felipe", cpf: "021.292.754-00", idade: 22, comissao: 0.5)
  Cliente.create!(email: "fabio.filho2001@hotmail.com", nome: "Fabio", telefone:"81993737193", cpf: "09104724402", idade: '22')
  Venda.create!(cliente: Cliente.first, veiculo: Veiculo.first, vendedor: Vendedor.first, valor: 95000.00, quantidade_veiculos: 1, status:'concluido')
  visit "/vendas/1"
  expect(page).to have_current_path('/vendas/1')
end

When('eu clico no botao Remover') do
  click_button 'Destroy this venda'
end

Then ('eu devo ver uma mensagem de Remocao') do
  expect(page).to have_content('Venda was successfully destroyed.')
end
