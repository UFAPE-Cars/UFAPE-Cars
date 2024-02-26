require "test_helper"

class VendedorTest < ActiveSupport::TestCase
  test 'vendedor deve ser válido' do
    vendedor = Vendedor.new(
      nome: "Joas Vitor",
      idade: 21,
      cpf: "123.456.789-00",
      comissao: 5.0
    )
    assert vendedor.valid?
  end

  test 'nome deve estar presente' do
    vendedor = Vendedor.new(
      nome: "",
      idade: 21,
      cpf: "123.456.789-00",
      comissao: 5.0
    )
    assert_not vendedor.valid?
  end

  test 'idade deve ser um número inteiro maior ou igual a 0' do
    vendedor = Vendedor.new(
      nome: "Joas Vitor",
      idade: -1,
      cpf: "123.456.789-00",
      comissao: 5.0
    )
    assert_not vendedor.valid?

    vendedor.idade = "abc"
    assert_not vendedor.valid?
  end

  test 'cpf deve estar no formato correto' do
    vendedor = Vendedor.new(
      nome: "Joas Vitor",
      idade: 21,
      cpf: "123.456.789",
      comissao: 5.0
    )
    assert_not vendedor.valid?

    vendedor.cpf = "123-456-789-00"
    assert_not vendedor.valid?
  end

  test 'cpf deve ser único' do
    vendedor = Vendedor.new(
      nome: "Joas Vitor",
      idade: 21,
      cpf: "123.456.789-00",
      comissao: 5.0
    )
    vendedor.save
    duplicate_vendedor = vendedor.dup
    assert_not duplicate_vendedor.valid?
  end

  test 'comissao deve ser um número maior ou igual a 0' do
    vendedor = Vendedor.new(
      nome: "Joas Vitor",
      idade: 21,
      cpf: "123.456.789-00",
      comissao: -1
    )
    assert_not vendedor.valid?

    vendedor.comissao = "abc"
    assert_not vendedor.valid?
  end

  test 'vendedor deve ter muitas vendas' do
    vendedor = Vendedor.new(
      nome: "Joas Vitor",
      idade: 21,
      cpf: "123.456.789-00",
      comissao: 5.0
    )
    assert_respond_to vendedor, :vendas
  end
end
