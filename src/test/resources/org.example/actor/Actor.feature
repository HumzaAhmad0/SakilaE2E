Feature: ActorListPage

  Background:
    Given the page "http://localhost:5173/actors" is loaded

  Scenario: the user clicks on create actor
    When the user selects "createactor-link" link
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: the user clicks on search actor
    When the user selects "searchactor-link" link
    Then the URL should be "http://localhost:5173/searchActors"

  Scenario: the list of actors should be displayed
    Then the page should contain "list-of-actors"

  Scenario: the specific film is displayed
    Then the page should contain "actorlist-name-2" with the text of "Ner Wahlberg"
    And should contain "actorlist-moreinfo-2"

  Scenario: the moreinfo button redirects properly
    When the user selects "actorlist-moreinfo-2" link
    Then the URL should be "http://localhost:5173/actor/2"