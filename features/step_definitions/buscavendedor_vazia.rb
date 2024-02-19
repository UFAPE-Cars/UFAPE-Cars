When('eu realizo uma busca vazia') do
  visit buscar_vendedors_path
  fill_in 'q', with: ''
  click_button 'Buscar'
end

Then('o sistema mostra os vendedores disponíveis sem o resultado da busca feita') do

end
