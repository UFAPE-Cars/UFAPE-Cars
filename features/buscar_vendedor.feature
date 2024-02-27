Feature: Buscar um vendedor
  Como um usuario do sistema
  Eu quero buscar um vendedor pelo seu nome
  Para que eu visualize o historico de vendas de um vendedor

  Scenario: Buscar vendedor pelo nome
    Given existe um vendedor com nome "Giovana"
    When eu busco o vendedor pelo nome "Giovana"
    Then devo visualizar o historico de vendas do vendedor

  Scenario: Buscar vendedor por CPF inexistente
    Given que eu estou na pagina de busca de vendedores
    When eu busco um vendedor pelo CPF "999.999.999-99"
    Then o sistema retorna nenhum vendedor

  Scenario: Buscar vendedor por CPF existente
    Given que eu estou na pagina de busca de vendedores
    And existe um vendedor com nome "Antonio", CPF "123.456.789-01"
    When eu busco um vendedor pelo CPF "123.456.789-01"
    Then o sistema retorna os detalhes do vendedor "Antonio"

  Scenario: Fazer uma busca vazia de um vendedor
    Given que eu estou na pagina de busca de vendedores
    When eu realizo uma busca vazia
    Then o sistema mostra os vendedores disponiveis sem o resultado da busca feita

  Scenario: Buscar vendedor por um numero que nao corresponde a nenhum vendedor
    Given que eu estou na pagina de busca de vendedores
    When eu busco o vendedor pelo numero de busca "12345"
    Then o sistema nao mostra nenhum vendedor