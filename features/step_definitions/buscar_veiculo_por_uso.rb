Given('Estou na pagina referente a busca de veiculos') do
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit '/veiculos/buscar'
  expect(page).to have_current_path('/veiculos/buscar')
  Veiculo.create!(modelo: "Carro Teste", ano: "2021", quilometragem: 100, uso: "Novo", historico_manutencao: "...", valor_anuncio: 100, tabela_fipe: 110)
end

When('Eu seleciono as condicoes de uso') do
  choose 'Novo'
end

And('Eu decido clicar no botao de buscar veiculo') do
  click_button 'Buscar'
end

Then('Eu vejo um veiculo com condicao de uso Novo') do
  expect(page).to have_content('Uso: Novo')
end