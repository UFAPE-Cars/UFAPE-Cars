Given('Estou na pagina de buscar veiculos') do
    visit '/veiculos/buscar'
    expect(page).to have_current_path('/veiculos/buscar')
    Veiculo.create!(modelo: "Carro Teste", ano: "2021", quilometragem: 100, uso: "Novo", historico_manutencao: "...", valor_anuncio: 100, tabela_fipe: 110)
  end
  
  When('Eu preencho os campos de busca com modelo {string}') do |modelo|
    fill_in 'Modelo', with: modelo
  end
  
  And('Eu clico no botao de buscar veiculo') do
    click_button 'Buscar'
  end
  
  Then('Eu vejo um veiculo com aquele nome') do
    expect(page).to have_content('Modelo: Carro Teste')
  end
  