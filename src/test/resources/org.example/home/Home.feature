Feature: Homepage
  Background:
    Given the page "http://localhost:5174/" is loaded


  Scenario Outline: The user clicks on a film
    When the user selects the "<card>" card
    Then the URL should be "<redirect-card>"

    Scenarios:
    |        card         |          redirect-card          |
    | spotlight-topfilm   | http://localhost:5174/film/1011 |
    |     sublight-1      | http://localhost:5174/film/810  |
    |     sublight-2      | http://localhost:5174/film/731  |
    |     sublight-3      | http://localhost:5174/film/393  |
    |     sublight-4      | http://localhost:5174/film/574  |

  Scenario Outline: the user clicks on a specific card
    Then the "<card>" should have the title of "<card-title>"

    Scenarios:
    |        card         |    card-title     |
    | spotlight-topfilm   |       NUM         |
    |     sublight-1      |    SLUMS DUCK     |
    |     sublight-2      |   RIGHT CRANES    |
    |     sublight-3      |  HALLOWEEN NUTS   |
    |     sublight-4      | MIDNIGHT WESTWARD |
#adding this to test github

#    idk if i need this for each nav link?
  Scenario: the user uses the navbar
    When the user selects "navbar-films" from the navbar
    Then the URL should be "http://localhost:5174/films"