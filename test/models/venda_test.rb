require 'test_helper'

class VendaTest < ActiveSupport::TestCase
  test "should not save venda without preco" do
    venda = Venda.new
    assert_not venda.save, "Saved the venda without a preco"
  end

  test "should not save venda with invalid status" do
    venda = Venda.new(valor: 100, status: "invalido")
    assert_not venda.save, "Saved the venda with invalid status"
  end

  test "should not save venda with invalid quantidade_veiculos" do
    venda = Venda.new(valor: 100, status: "pendente", quantidade_veiculos: 0)
    assert_not venda.save, "Saved the venda with invalid quantidade_veiculos"
  end
end
