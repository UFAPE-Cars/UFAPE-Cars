class CreateVendedors < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:vendedors)
      create_table :vendedors do |t|
        t.string :nome
        t.integer :idade
        t.string :cpf
        t.float :comissao
        t.timestamps
      end
    end
  end
end

