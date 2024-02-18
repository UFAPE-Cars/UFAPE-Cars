class CreateVendas < ActiveRecord::Migration[7.0]
  def change
    create_table :vendas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :veiculo, null: false, foreign_key: true
      t.references :vendedor, null: false, foreign_key: true
      t.decimal :valor
      t.integer :quantidade_veiculos
      t.string :status

      t.timestamps
    end
  end
end
