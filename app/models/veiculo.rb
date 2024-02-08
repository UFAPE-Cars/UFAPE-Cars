class Veiculo < ApplicationRecord

  has_many :vendas

  validates :modelo, presence: true, length: {minimum: 2, maximum: 50}
  validates :modelo, format: {with: /\A[a-zA-Z0-9\s]+\z/, message: "do modelo deve conter apenas letras, números e espaços"}

  validates :ano, presence: true, inclusion: {in: 1980...2024, message: "deve ser preenchido entre os anos de 1900 até 2024"}
  validates :quilometragem, presence: true, inclusion: {in: 0...999999, message: "deve estar entre 0 até 999999"}
  validates :uso, presence: true, inclusion: { in: %w[Novo Usado Seminovo], message: "do veiculo deve ser algo entre Novo, Usado ou Seminovo"}
  validates :historico_manutencao, length: {maximum: 100, message: "deve conter entre 4 à 100 caractéres"}
  validates :valor_anuncio, presence: true, numericality: {greater_than_or_equal_to: 1, message: "deve ser um número maior ou igual a 1"}
  validates :tabela_fipe, presence: true

  before_validation :calcular_tabela_fipe

  def calcular_tabela_fipe
    return unless ano.present? && valor_anuncio.present?

    descontos = {
      (1980..1990) => 0.2,
      (1990..2000) => 0.15,
      (2000..2010) => 0.1,
      (2010..2020) => 0.08,
      (2020..2024) => 0.05
    }

    desconto_percentual = descontos.find { |intervalo, _| intervalo.include?(ano.to_i) }&.last || descontos.values.last
    self.tabela_fipe = valor_anuncio * (1 - desconto_percentual)
  end

end
