json.extract! venda, :id, :cliente_id, :veiculo_id, :vendedor_id, :valor, :quantidade_veiculos, :status, :created_at, :updated_at
json.url venda_url(venda, format: :json)
