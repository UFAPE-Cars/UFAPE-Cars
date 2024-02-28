Given('eu estou na pagina de edicao de venda') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  Veiculo.create!(modelo: "HB20", ano: "2022", quilometragem: 0, uso: "Novo", historico_manutencao: "...", valor_anuncio: 100, tabela_fipe: 110)
  Vendedor.create!(nome: "Felipe", cpf: "021.292.754-00", idade: 22, comissao: 0.5)
  Cliente.create!(email: "fabio.filho2001@hotmail.com", nome: "Fabio", telefone:"81993737193", cpf: "09104724402", idade: '22')
  Venda.create!(cliente: Cliente.first, veiculo: Veiculo.first, vendedor: Vendedor.first, valor: 95000.00, quantidade_veiculos: 1, status:'concluido')
  visit "/vendas/1/edit"
  expect(page).to have_current_path('/vendas/1/edit')
end

When('eu modifico os detalhes da venda') do
  fill_in 'Valor:', with: '95000.00'
  fill_in 'Quantidade de Veículos:', with: '1'
  fill_in 'Status:', with: 'cancelado'
end

When('eu clico no botao Editar venda') do
  click_button 'Update Venda'
end

Then('eu devo ver uma mensagem de Update') do
  expect(page).to have_content('Venda was successfully updated.')
end