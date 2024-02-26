require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
  setup do
    @cliente = Cliente.new(nome: "João Silva",
                           telefone: "(11)98765-4321",
                           email: "joao@example.com",
                           cpf: "12345678901",
                           idade: 30)
  end

  test "cliente válido" do
    assert @cliente.valid?
  end

  test "nome deve estar presente e dentro dos limites de tamanho" do
    @cliente.nome = ""
    assert_not @cliente.valid?
    @cliente.nome = "A" * 101 # Mais de 100 caracteres
    assert_not @cliente.valid?
  end

  test "telefone deve seguir o formato especificado" do
    @cliente.telefone = "1187654321" # Formato incorreto
    assert_not @cliente.valid?
    @cliente.telefone = "(11)98765-4321" # Formato correto com formatação
    assert @cliente.valid?
    @cliente.telefone = "11987654321" # Formato correto sem formatação
    assert @cliente.valid?
  end


  test "email deve ser único e ter formato válido" do
    duplicate_cliente = @cliente.dup
    @cliente.save
    assert_not duplicate_cliente.valid?
    duplicate_cliente.email = "invalid_email"
    assert_not duplicate_cliente.valid?
  end

  test "cpf deve ser único, ter 11 dígitos e apenas números" do
    @cliente.cpf = "1234567890" # Menos de 11 dígitos
    assert_not @cliente.valid?
    @cliente.cpf = "123456789012" # Mais de 11 dígitos
    assert_not @cliente.valid?
    @cliente.cpf = "abcdefghijk" # Não numérico
    assert_not @cliente.valid?
  end

  test "idade deve ser um número inteiro e estar dentro do intervalo especificado" do
    @cliente.idade = -1
    assert_not @cliente.valid?
    @cliente.idade = 0
    assert_not @cliente.valid?
    @cliente.idade = 121 # Acima do limite
    assert_not @cliente.valid?
  end
end
