Feature: Acessando  contatos
    As a User
    I wannna click on contacts button
    To access the page with the contact information of the developers

  Background: Estou na pagina inicial
    Given I am on the home page
    
  Scenario: Successful access of contacts page (caminho feliz)
    When click on the Contatos link
    Then I should see the Contatos