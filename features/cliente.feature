Feature: Gerenciamento de cliente
  As a Usuario do sistema
  I want to registrar, editar e remover um cliente da concessionaria
  So that eu mantenha o registro de clientes atualizado

  Scenario: registrar cliente
    Given Estou na pagina de registrar um cliente
    When Eu preencho os campos de registro com nome 'Maria', telefone '81991195192', email 'maria@email.com', cpf '12345678978', idade 27
    And Eu clico no botao de registrar cliente
    Then Eu vejo uma mensagem de cliente registrado

  Scenario: registrar cliente incorretamente
    Given Estou na pagina referente ao de registrar um cliente
    When O cliente com os campos de registro com nome 'Marcos', telefone '81991159562', email 'marcos@gmail.com', cpf 'cpf', idade 75 existe
    And A seguir, eu clico no botao de registrar cliente
    Then Eu vejo uma mensagem de erro informando que o registro do cliente falhou

  Scenario: editar um cliente
    Given O cliente de nome 'José', telefone '81991195192', email 'jose@outlook.com', cpf '12345678912', idade 50 existe
    When Eu clico em editar cliente
    And Eu altero a idade para 30
    And Eu clico no botao para atualizar o cliente
    Then Eu vejo uma mensagem de cliente atualizado

  Scenario: remover um cliente
    Given O cliente com o nome 'João', telefone '81991195192', email 'joao@outlook.com', cpf '12345678912', idade 25 existe
    When Eu clico em remover cliente
    Then Eu vejo uma mensagem de cliente removido com sucesso

  Scenario: editar um cliente incorretamente
    Given O cliente ja registrado de nome 'Romário', telefone '81991195192', email 'romario@outlook.com', cpf '12345678912', idade 18 existe
    When Eu clico no link de editar cliente
    And Eu altero o campo do cpf para 'meu cpf'
    And Eu clico no devido botao para atualizar o cliente
    Then Eu vejo uma mensagem informando o erro