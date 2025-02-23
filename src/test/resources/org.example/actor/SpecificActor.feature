Feature: Specific actor page

  Scenario: Specific actor page contains the right information
    Given the page "http://localhost:5173/actor/3" is loaded
    Then the page should contain "specific-actor-id" with the text of "3"
    And the page should contain "specific-actor-first-name" with the text of "A"
    And the page should contain "specific-actor-last-name" with the text of "B"
    And the page should contain "specific-actor-full-name" with the text of "A B"
    And the page should contain "specific-actor-film-titles" with the text of "ADAPTATION HOLES"
    And the page should contain "specific-actor-first-name" with the text of "3"
