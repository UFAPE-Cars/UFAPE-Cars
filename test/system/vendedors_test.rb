require "application_system_test_case"

class VendedorsTest < ApplicationSystemTestCase
  setup do
    @vendedor = vendedors(:one)
  end

  test "visiting the index" do
    visit vendedors_url
    assert_selector "h1", text: "Vendedors"
  end

  test "should create vendedor" do
    visit vendedors_url
    click_on "New vendedor"

    fill_in "Comissao", with: @vendedor.comissao
    fill_in "Cpf", with: @vendedor.cpf
    fill_in "Idade", with: @vendedor.idade
    fill_in "Nome", with: @vendedor.nome
    click_on "Create Vendedor"

    assert_text "Vendedor was successfully created"
    click_on "Back"
  end

  test "should update Vendedor" do
    visit vendedor_url(@vendedor)
    click_on "Edit this vendedor", match: :first

    fill_in "Comissao", with: @vendedor.comissao
    fill_in "Cpf", with: @vendedor.cpf
    fill_in "Idade", with: @vendedor.idade
    fill_in "Nome", with: @vendedor.nome
    click_on "Update Vendedor"

    assert_text "Vendedor was successfully updated"
    click_on "Back"
  end

  test "should destroy Vendedor" do
    visit vendedor_url(@vendedor)
    click_on "Destroy this vendedor", match: :first

    assert_text "Vendedor was successfully destroyed"
  end
end
