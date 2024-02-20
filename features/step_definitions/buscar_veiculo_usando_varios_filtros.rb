Given('Entro na pagina de busca de veiculos') do
    visit '/veiculos/buscar'
    expect(page).to have_current_path('/veiculos/buscar')
    Veiculo.create!(modelo: "Carro Teste", ano: "2021", quilometragem: 100, uso: "Novo", historico_manutencao: "...", valor_anuncio: 100, tabela_fipe: 110)
  end
  
  When('Eu preencho os campos com modelo {string}, valor_minimo {float}, valor_maximo {float} e seleciono as condicoes de uso') do |modelo, valor_minimo, valor_maximo|
    fill_in 'Modelo', with: modelo
    choose 'Novo'
    fill_in 'Valor mínimo', with: valor_minimo
    fill_in 'Valor máximo', with: valor_maximo
  end
  
  And('Eu clico em buscar') do
    click_button 'Buscar'
  end
  
  Then('Eu vejo um veiculo com aqueles atributos') do
    expect(page).to have_content('Modelo: Carro Teste')
    expect(page).to have_content('Uso: Novo')
    expect(page).to have_content('Valor anuncio: R$ 100')
  end