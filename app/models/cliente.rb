class Cliente < ApplicationRecord
  # Relacionamentos
  has_many :vendas, dependent: :destroy

  # Validations
  validates :nome, presence: true, length: { minimum: 2, maximum: 100 }
  validates :telefone, presence: true, length: { minimum: 10, maximum: 15 }, format: { with: /\A\+?\d{2}\d{8,9}\z/, message: "deve começar com DDD e ter 8 ou 9 dígitos para o número" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "formato inválido" }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }, format: { with: /\A\d{11}\z/, message: "deve ter 11 dígitos" }
  validates :idade, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 120 }

  validate :cpf_valido

  private

  def cpf_valido
    unless CPF.valid?(cpf)
      errors.add(:cpf, "não é válido")
    end
  end
end
