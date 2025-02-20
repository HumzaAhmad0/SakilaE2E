Feature: Homepage

  Scenario Outline: The user clicks on a film
    Given the page "http://localhost:5174/" is loaded
    When the user selects the "<card>" card
    Then the URL should be "<redirect-card>"

    Scenarios:
    |        card         |          redirect-card          |
    | spotlight-topfilm   | http://localhost:5174/film/1011 |
    |     sublight-1      | http://localhost:5174/film/810  |
    |     sublight-2      | http://localhost:5174/film/731  |
    |     sublight-3      | http://localhost:5174/film/393  |
    |     sublight-4      | http://localhost:5174/film/574  |

  Scenario Outline:
    Given the page "http://localhost:5174/" is loaded
    Then the "<card>" should have the title of "<card-title>"

    Scenarios:
    |        card         |    card-title     |
    | spotlight-topfilm   |       NUM         |
    |     sublight-1      |    SLUMS DUCK     |
    |     sublight-2      |   RIGHT CRANES    |
    |     sublight-3      |  HALLOWEEN NUTS   |
    |     sublight-4      | MIDNIGHT WESTWARD |


#    idk if i need this for each nav link?
  Scenario:
    Given the page "http://localhost:5174/" is loaded
    When the user selects "navbar-films" from the navbar
    Then the URL should be "http://localhost:5174/films"