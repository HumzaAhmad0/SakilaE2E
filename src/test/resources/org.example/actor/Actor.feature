Feature: ActorListPage

  Scenario: the user clicks on create actor
    Given the page "http://localhost:5174/actors" is loaded
    When the user selects "createactor-link" link
    Then the URL should be "http://localhost:5174/createActor"

  Scenario: the user clicks on search actor
    Given the page "http://localhost:5174/actors" is loaded
    When the user selects "searchactor-link" link
    Then the URL should be "http://localhost:5174/searchActors"

  Scenario: the list of actors should be displayed
    Given the page "http://localhost:5174/actors" is loaded
    Then the page should contain "list-of-actors"

  Scenario: the specific film is displayed
    Given the page "http://localhost:5174/actors" is loaded
    Then the page should contain "actorlist-name-3" with the text of "ED CHASE"
    And should contain "actorlist-moreinfo-3"

  Scenario: the moreinfo button redirects properly
    Given the page "http://localhost:5174/actors" is loaded
    When the user selects "actorlist-moreinfo-3" link
    Then the URL should be "http://localhost:5174/actor/3"