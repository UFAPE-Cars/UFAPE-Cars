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

  test 'veiculo nao deve ser valido com nome de modelo com menos de dois caracteres' do
    veiculo = Veiculo.new(
      modelo: 'a',
      ano: 2020,
      quilometragem: 50000,
      uso: 'Usado',
      historico_manutencao: 'Manutenção em dia',
      valor_anuncio: 30000
    )
    assert_not veiculo.valid?
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

  test 'veiculo nao deve ser valido com valor de quilometragem negativo' do
    veiculo = Veiculo.new(
      modelo: 'Carro Teste',
      ano: 2020,
      quilometragem: -50000,
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

  test 'veiculo deve ser valido com historico_manutencao vazio' do
    veiculo = Veiculo.new(
      modelo: 'Carro Teste',
      ano: 2020,
      quilometragem: 50000,
      uso: 'Usado',
      historico_manutencao: '',
      valor_anuncio: 30000
    )
    assert veiculo.valid?
  end

  test 'veiculo nao deve ser valido para valor_anuncio menor que 1' do
    veiculo = Veiculo.new(
      modelo: 'Carro Teste',
      ano: 2020,
      quilometragem: 50000,
      uso: 'Usado',
      historico_manutencao: 'Manutenção em dia',
      valor_anuncio: 0.2
    )
    assert_not veiculo.valid?
  end

end
