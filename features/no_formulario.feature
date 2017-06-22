Feature: Editar formulario
  As a User
  I wannna insert my location on system 
  To acess the school list near me on form page
 
  Background: Estou entrando na pagina do school
    Given I am on the form page
    
  Scenario Outline: Adicionando a localização com sucesso (Caminho feliz)
    When put <latitude> on the latitude input
    And put <longitude> on the longitude input
    And put <radius> on the radius input
    And click on the Enviar button
    Then I should see the Schools rank

  Examples:
    | latitude | longitude | radius |
    | 1.85 | 1.2 | 10 |
    | 2.3 | 4.5 | 100 |
    | 14 | 15 | 1 |
 
  Scenario: Adicionando a localização invalido (Caminho triste)
    When latitude input is empty
    And longitude input is empty
    And radius input is empty
    And click on the Enviar button
    Then I should see the Schools rank
