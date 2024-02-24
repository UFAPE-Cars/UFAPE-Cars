Feature: Buscar um vendedor
  Como um usuário do sistema
  Eu quero buscar um vendedor pelo seu nome
  Para que eu visualize o histórico de vendas de um vendedor

  Scenario: Buscar vendedor pelo nome
    Given existe um vendedor com nome "Giovana"
    When eu busco o vendedor pelo nome "Giovana"
    Then devo visualizar o histórico de vendas do vendedor

  Scenario: Buscar vendedor por CPF inexistente
    Given que eu estou na página de busca de vendedores
    When eu busco um vendedor pelo CPF "999.999.999-99"
    Then o sistema não retorna nada

  Scenario: Buscar vendedor por CPF existente
    Given que eu estou na página de busca de vendedores
    And existe um vendedor com nome "Antonio", CPF "123.456.789-01"
    When eu busco um vendedor pelo CPF "123.456.789-01"
    Then o sistema retorna os detalhes do vendedor "Antonio"
  Scenario: Fazer uma busca vazia de um vendedor
    Given que eu estou na página de busca de vendedores
    When eu realizo uma busca vazia
    Then o sistema mostra os vendedores disponíveis sem o resultado da busca feita
  Scenario: Buscar vendedor por um número que não corresponde a nenhum vendedor
    Given que eu estou na página de busca de vendedores
    When eu busco o vendedor pelo número de busca "12345"
    Then o sistema nao mostra nenhum vendedor