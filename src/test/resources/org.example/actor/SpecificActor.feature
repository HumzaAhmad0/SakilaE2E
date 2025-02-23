Feature: Specific actor page

  Scenario: Specific actor page contains the right information
    Given the page "http://localhost:5173/actor/3" is loaded
    Then the page should contain "specific-actor-id" with the text of "3"
    And the page should contain "specific-actor-first-name" with the text of "A"
    And the page should contain "specific-actor-last-name" with the text of "B"
    And the page should contain "specific-actor-full-name" with the text of "A B"
    And the page should contain "specific-actor-film-titles" with the text of "ADAPTATION HOLES"

  Scenario: Update actor redirect to update from specific actor page
    Given the page "http://localhost:5173/actor/3" is loaded
    When the user selects "specific-actor-update-link" link
    Then the URL should be "http://localhost:5173/updateActor/3"

  Scenario: Update actor redirect to all actors from specific actor page
    Given the page "http://localhost:5173/actor/3" is loaded
    When the user selects "specific-actor-all-actors-link" link
    Then the URL should be "http://localhost:5173/actors"

#    need to add placeholder id
#  Scenario: Deleting an actor
#    Given the page "http://localhost:5173/actor/NEED TO PUT PLACEHOLDER" is loaded
#    When the user clicks the "specific-actor-delete-button" button
#    Then the URL should be "http://localhost:5173/actors"


