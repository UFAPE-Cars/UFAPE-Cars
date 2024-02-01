json.extract! veiculo, :id, :modelo, :ano, :quilometragem, :uso, :historico_manutencao, :tabela_fipe, :valor_anuncio, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)
