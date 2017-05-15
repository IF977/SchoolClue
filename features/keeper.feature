Feature: keeper
    As a User
    I wannna insert my location on system
    To acess the school list near me
 
  Scenario Outline: Sucessfull select the location
    Given I am on the location page
    When put <latitude> on the latitude input
    And put <longitude> on the longitude input
    And put <radius> on the radius input
    And click on the Enviar button
    Then I should see the schools on my location range.
    
    Examples:
      | latitude | longitude | radius |
      | 1.85 | 1.2 | 10 |
      | 2.3 | 4.5 | 100 |
      | 14 | 15 | 1 |

        