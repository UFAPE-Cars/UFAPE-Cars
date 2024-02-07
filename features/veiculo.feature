Feature: Gerenciamento de veiculo
  As a Usuario do sistema
  I want to registrar, editar e remover um veiculo
  So that eu mantenha a frota de veiculos atualizada

  Scenario: registrar veiculo
    Given Estou na pagina de registrar um veiculo
    When Eu preencho os campos de registro com modelo 'Carro Teste', ano '2020', quilometragem '50000', uso 'Usado', historico de manutencao 'Manutenções regulares, sem problemas significativos.' e valor de anuncio '35000'
    And Eu clico no botao de registrar veiculo
    Then Eu vejo uma mensagem de veiculo registrado

  Scenario: registrar veiculo incorretamente
    Given Estou na pagina referente ao de registrar um veiculo
    When O veiculo com os campos de registro com modelo 'a', ano '1975', quilometragem '-1', uso 'Bastante', historico de manutencao 'Coisas demais para serem listadas' e valor de anuncio '0.5' existe
    And A seguir, eu clico no botao de registrar veiculo
    Then Eu vejo uma mensagem de erro informando que o registro do veiculo falhou

  Scenario: editar um veiculo
    Given O veiculo de modelo 'Fiat Uno', ano '2005', quilometragem '44444', uso 'Usado', historico de manutencao 'Rodas trocadas' e valor de anuncio '20000' existe
    When Eu clico em editar veiculo
    And Eu altero a quilometragem para '45000'
    And Eu clico no botao para atualizar o veiculo
    Then Eu vejo uma mensagem de veiculo atualizado

  Scenario: editar um veiculo incorretamente
    Given O veiculo ja registrado de modelo 'Fiat Dois', ano '2010', quilometragem '55555', uso 'Usado', historico de manutencao 'Rodas e volantes trocados' e valor de anuncio '40000' existe
    When Eu clico no link de editar veiculo
    And Eu altero o valor da quilometragem para '-55555'
    And Eu clico no devido botao para atualizar o veiculo
    Then Eu vejo uma mensagem de erro

  Scenario: remover um veiculo
    Given O veiculo com o modelo 'Chevrolet Camaro', ano '2018', quilometragem '30000', uso 'Seminovo', historico de manutencao 'Manutenções em concessionária autorizada, sem problemas significativos.' e valor de anuncio '80000' existe
    When Eu clico em remover veiculo
    Then Eu vejo uma mensagem de veiculo removido com sucesso