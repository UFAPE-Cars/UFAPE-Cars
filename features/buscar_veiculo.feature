Feature: Busca de veiculo
  As a Usuario do sistema
  I want to buscar um veiculo por seus atributos
  So that eu encontre o que procuro

  Scenario: buscar veiculo por modelo
    Given Estou na pagina de buscar veiculos
    When Eu preencho os campos de busca com modelo 'Carro Teste'
    And Eu clico no botao de buscar veiculo
    Then Eu vejo um veiculo com aquele nome

  Scenario: buscar veiculo por uso
    Given Estou na pagina referente a busca de veiculos
    When Eu seleciono as condicoes de uso
    And Eu decido clicar no botao de buscar veiculo
    Then Eu vejo um veiculo com condicao de uso Novo


  Scenario: buscar veiculo por preco
    Given Acesso a pagina de busca de veiculos
    When Eu preencho os campos com valor_minimo 10, valor_maximo 100
    And Eu seleciono o botao de busca
    Then Eu vejo um veiculo naquela faixa de preco

  Scenario: buscar veiculo usando varios filtros
    Given Entro na pagina de busca de veiculos
    When Eu preencho os campos com modelo "Carro Teste", valor_minimo 10, valor_maximo 100 e seleciono as condicoes de uso
    And Eu clico em buscar
    Then Eu vejo um veiculo com aqueles atributos

  Scenario: buscar veiculo nao registrado
    Given Chego na pagina de busca de veiculos
    When Eu preencho os campos com valor_maximo 10, valor_minimo 1000
    And Eu clico no botao de busca
    Then Eu vejo uma mensagem informando que nao existe veiculos com aquelas caracteristicas