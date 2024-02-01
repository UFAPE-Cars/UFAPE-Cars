class Vendedor < ApplicationRecord
  has_many :vendas

  validates :nome, presence: true
  validates :idade, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/ }
  validates :comissao, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
