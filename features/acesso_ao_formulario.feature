Feature: Acessando  os formularios
    As a User
    I wannna click on search here button
    To access the form page

  Background: Estou na pagina inicial
    Given I am on the home page
    
  Scenario: Successful access of formulario page (caminho feliz)
    When click on the Busque Aqui link
    Then I should see the Selecione sua localização no mapa