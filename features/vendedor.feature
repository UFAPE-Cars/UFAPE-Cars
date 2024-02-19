Feature: Buscar um vendedor
  As a Usuario do sistema
  I want to buscar um vendedor pelo seu nome ou CPF
  So that eu visualize o historico de vendas de um vendedor

  Scenario: Buscar vendedor pelo nome ou CPF
    Given existe um vendedor com nome "Giovana", CPF "124.208.534-10"
    When eu busco o vendedor pelo nome "Giovana"
    Then devo visualizar o histórico de vendas do vendedor
