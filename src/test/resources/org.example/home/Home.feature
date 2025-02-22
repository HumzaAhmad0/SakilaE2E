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

  Scenario Outline: the page should contain
    Then the "<card>" should have the title of "<card-title>"
    And the "<card>" should have the year "<year>"
    And the "<card>" should have the score "<score>"
    And the "spotlight-desc-topfilm" should have the description "number 1"

    Scenarios:
      |        card         |    card-title     |           year        |    score    |
      | spotlight-topfilm   |       NUM         |   Release Year: 2010 |   100/100   |
      |     sublight-1      |    SLUMS DUCK     |           1987        |  99.95/100  |
      |     sublight-2      |   RIGHT CRANES    |           1983        |  99.93/100  |
      |     sublight-3      |  HALLOWEEN NUTS   |           1981        |  99.76/100  |
      |     sublight-4      | MIDNIGHT WESTWARD |           2026        |  99.74/100  |

  Scenario: the user uses the navbar
    When the user selects "navbar-films" from the navbar
    Then the URL should be "http://localhost:5174/films"