json.extract! vendedor, :id, :nome, :idade, :cpf, :comissao, :created_at, :updated_at
json.url vendedor_url(vendedor, format: :json)
