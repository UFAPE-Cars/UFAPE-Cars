class CreateVeiculos < ActiveRecord::Migration[7.0]
  def change
    create_table :veiculos do |t|
      t.string :modelo
      t.integer :ano
      t.float :quilometragem
      t.string :uso
      t.text :historico_manutencao
      t.float :tabela_fipe
      t.float :valor_anuncio

      t.timestamps
    end
  end
end
