Feature: Search Actor Page
  Background:
    Given the page "http://localhost:5173/searchActors" is loaded


  Scenario: the input fields are enabled initially
    Then the "actor-search-id" field should be enabled
    And the "actor-search-name" field should be enabled

  Scenario: The name field is disabled when the user enters a value in the ID field
    When the user enters "3" in the "actor-search-id" field
    Then the "actor-search-name" field should be disabled

  Scenario: The name field is enabled when the user deletes the ID field value
    When the user enters "3" in the "actor-search-id" field
    And the user deletes the value in the "actor-search-id" field
    Then the "actor-search-name" field should be enabled

  Scenario: The ID field is disabled when the user enters a value in the name field
    When the user enters "J" in the "actor-search-name" field
    Then the "actor-search-id" field should be disabled

  Scenario: The ID field is enabled when the user deletes the value in the name field
    When the user enters "J" in the "actor-search-name" field
    And the user deletes the value in the "actor-search-name" field
    Then the "actor-search-id" field should be enabled

  Scenario: the user searches with a valid actor ID
    When the user enters "2" in the "actor-search-id" field
    And the user clicks the "actor-search-submit-button" button
    Then the page should contain "searched-actor-id" with the text of "ID: 2"
#    And the page should contain "searched-actor-first-name" with the text of "NER"
#    And the page should contain "searched-actor-last-name" with the text of "WAHLBERG"
    And the page should contain "searched-actor-full-name" with the text of "NER WAHLBERG"
    And the page should contain "searched-actor-film-titles-1" with the text of "Antitrust Tomatoes"

  Scenario: the user searches with a valid actor ID and redirects to movie
    When the user enters "2" in the "actor-search-id" field
    And the user clicks the "actor-search-submit-button" button
    When the user selects "searched-actor-film-titles-1" link
    Then the URL should be "http://localhost:5173/film/29"

  Scenario: the user searches with a valid actor ID and redirects to specific details
    When the user enters "2" in the "actor-search-id" field
    And the user clicks the "actor-search-submit-button" button
    When the user selects "searched-actor-more-info" link
    Then the URL should be "http://localhost:5173/actor/2"

  Scenario: the user searches with an invalid actor ID
    When the user enters "3000" in the "actor-search-id" field
    And the user clicks the "actor-search-submit-button" button
    Then the page should contain "actor-search-error-message" with the text of "Actor not found, ERROR 404"

  Scenario: the user searches for actors with "john" in their name
    When the user enters "johnn" in the "actor-search-name" field
    And the user clicks the "actor-search-submit-button" button
    Then the page should contain "list-of-filtered-actors"
    And the page should contain "actorlist-name-1" with the text of "Johnny Lollobrigida"
    And the page should contain "actorlist-name-2" with the text of "Johnny Cage"

  Scenario: the user searches for actors with "john" in their name and directs to more info
    When the user enters "johnn" in the "actor-search-name" field
    And the user clicks the "actor-search-submit-button" button
    When the user selects "actorlist-moreinfo-2" link
    Then the URL should be "http://localhost:5173/actor/40"

  Scenario: the user searches for actors with not available in their name
    When the user enters "not found" in the "actor-search-name" field
    And the user clicks the "actor-search-submit-button" button
    Then the page should contain "actor-search-no-results" with the text of "No results found"

  Scenario: the user selects the go back link
    When the user selects "actor-search-go-back" link
    Then the URL should be "http://localhost:5173/actors"


#  loading?
#  need to add validation and check that
#  cant enter other than numbers for id?