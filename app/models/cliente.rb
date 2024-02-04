class Cliente < ApplicationRecord
  # Relacionamentos
  has_many :vendas, dependent: :destroy

  # Validations
  validates :nome, presence: true, length: { minimum: 2, maximum: 100 }
  validates :telefone, presence: true, format: { with: /\A\(\d{2}\)\d{5}-\d{4}|\d{11}\z/, message: "deve estar no formato (DDD)99999-9999 ou DDD99999999" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "formato inválido" }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }, format: { with: /\A\d{11}\z/, message: "deve ter 11 dígitos" }
  validates :idade, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 120 }
end
