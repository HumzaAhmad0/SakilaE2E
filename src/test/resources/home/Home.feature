Feature: Homepage
  Background:
    Given the page "http://localhost:5173/" is loaded

  Scenario Outline: The user clicks on a film
    When the user selects the "<card>" card
    Then the URL should be "<redirect-card>"

    Scenarios:
    |        card         |          redirect-card          |
    | spotlight-topfilm   | http://localhost:5173/film/810  |
    |     sublight-1      | http://localhost:5173/film/731  |
    |     sublight-2      | http://localhost:5173/film/393  |
    |     sublight-3      | http://localhost:5173/film/574  |
    |     sublight-4      | http://localhost:5173/film/333  |

  Scenario Outline: the page should contain
    Then the "<card>" should have the title of "<card-title>"
    And the "<card>" should have the year "<year>"
    And the "<card>" should have the score "<score>"
    And the "spotlight-desc-topfilm" should have the description "A Amazing Character Study of a Teacher And a Database Administrator who must Defeat a Waitress in A Jet Boat"

    Scenarios:
      |        card         |    card-title     |           year        |    score    |
      | spotlight-topfilm   |    SLUMS DUCK     |   Release Year: 1987  |  99.95/100  |
      |     sublight-1      |   RIGHT CRANES    |           1983        |  99.93/100  |
      |     sublight-2      |  HALLOWEEN NUTS   |           1981        |  99.76/100  |
      |     sublight-3      | MIDNIGHT WESTWARD |           2026        |  99.74/100  |
      |     sublight-4      |   FREAKY POCUS    |           2009        |  99.72/100  |

  Scenario: the user uses the navbar
    When the user selects "navbar-films" from the navbar
    Then the URL should be "http://localhost:5173/films"