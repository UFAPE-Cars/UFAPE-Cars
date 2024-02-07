class Venda < ApplicationRecord

  belongs_to :cliente
  belongs_to :veiculo
  belongs_to :vendedor

  validates :cliente_id, presence: true
  validates :vendedor_id, presence: true

  validates :valor, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w(pendente concluido cancelado) }
  validates :quantidade_veiculos, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }
end
