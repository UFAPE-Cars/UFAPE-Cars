Feature: Gerenciamento de vendedor
  As a Usuário do sistema
  I want to registrar, editar e remover um vendedor da concessionária
  So that eu mantenha o registro de vendedores atualizado

  Scenario: Registrar vendedor
    Given Estou na pagina referente a registrar um vendedor
    When Eu preencho os campos de registro com o nome 'Joás', idade '21', cpf '123.456.789-78', comissão '0'
    And Eu clico no botao de registrar vendedor
    Then Eu vejo uma mensagem de vendedor registrado

  Scenario: Registrar vendedor incorretamente
    Given Estou na pagina referente ao de registrar um vendedor
    When O vendedor com os campos de registro com nome 'Marcos', idade '75', cpf 'cpf', comissão '0'
    And A seguir, eu clico no botao de registrar vendedor
    Then Eu vejo uma mensagem de erro informando que o registro do vendedor falhou

  Scenario: editar um vendedor
    Given O vendedor de nome 'Paulo', idade '25', cpf '123.456.789-78', comissão '0' existe
    When Eu clico em editar vendedor
    And Eu altero a idade do vendedor para 30
    And Eu clico no botao para atualizar o vendedor
    Then Eu vejo uma mensagem de vendedor atualizado

  Scenario: remover um vendedor
    Given O vendedor com o nome 'Bruno', idade '36', cpf '123.356.789-78', comissão '5' existe
    When Eu clico em remover vendedor
    Then Eu vejo uma mensagem de vendedor removido com sucesso

  Scenario: editar um vendedor incorretamente
    Given O vendedor ja registrado de nome 'Mauro', idade '38', cpf '123.356.789-78', comissão '5' existe
    When Eu clico no link de editar vendedor
    And Eu altero o campo de cpf para 'meu cpf'
    And Eu clico no devido botao para atualizar o vendedor
    Then Eu vejo uma mensagem informando o erro ocorrido