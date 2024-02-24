Feature: Gerenciamento de venda
  As a Usuario do sistema
  I want to registrar, editar e remover uma venda de veiculo
  So that eu mantenha o registro de vendas atualizado

  Scenario: registrar uma nova venda de veiculo
    Given eu estou na pagina de criacao de venda
    When eu preencho os detalhes da venda
    And eu clico no botão Criar venda
    Then eu devo ver uma mensagem de sucesso

  Scenario: editar uma venda existente
    Given eu estou na pagina de edicao de venda
    When eu modifico os detalhes da venda
    And eu clico no botao Editar venda
    Then eu devo ver uma mensagem de Update

  Scenario: Remover uma venda existente
    Given eu estou na pagina de detalhes da venda
    When eu clico no botao Remover
    Then eu devo ver uma mensagem de Remocao

  Scenario: Visualizar detalhes de uma venda
    Given vejo que existem vendas registradas no sistema
    When eu seleciono uma venda especifica
    Then eu devo ver os detalhes completos da venda

  Scenario: Listar todas as vendas registradas
    Given que existem varias vendas registradas no sistema
    When eu visito a pagina de listagem de vendas
    Then eu devo ver uma lista de todas as vendas com seus detalhes
