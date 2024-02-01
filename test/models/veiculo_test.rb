require "test_helper"

class VeiculoTest < ActiveSupport::TestCase
  test 'veiculo deve ser valido' do
    veiculo = Veiculo.new(
      modelo: 'Carro Teste',
      ano: 2020,
      quilometragem: 50000,
      uso: 'Usado',
      historico_manutencao: 'Manutenção em dia',
      valor_anuncio: 30000
    )
    assert veiculo.valid?
  end

  test 'veiculo nao deve ser valido com ano inferior a 1980' do
    veiculo = Veiculo.new(
      modelo: 'Carro Teste',
      ano: 1979,
      quilometragem: 50000,
      uso: 'Usado',
      historico_manutencao: 'Manutenção em dia',
      valor_anuncio: 30000
    )
    assert_not veiculo.valid?
  end

  test 'veiculo nao deve ser valido com o uso diferente de usado, novo ou seminovo' do
    veiculo = Veiculo.new(
      modelo: 'Carro Teste',
      ano: 2020,
      quilometragem: 50000,
      uso: 'Bastante',
      historico_manutencao: 'Manutenção em dia',
      valor_anuncio: 30000
    )
    assert_not veiculo.valid?
  end

end
