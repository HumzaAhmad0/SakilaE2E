Feature: Specific film page

  Scenario: Specific film page should have the right information
    Given the page "http://localhost:5174/film/21" is loaded
    Then the page should contain "specific-film-title" with the text of "AMERICAN CIRCUS"
    And the page should contain "specific-film-release-year" with the text of "1993"
    And the page should contain "specific-film-description" with the text of "A Insightful Drama of a Girl And a Astronaut who must Face a Database Administrator in A Shark Tank"
    And the page should contain "specific-film-language" with the text of "Language: English"
    And the page should contain "specific-film-movie-length" with the text of "Run Time: 2h 9m"
    And the page should contain "specific-film-rating" with the text of "Rated: R"
    And the page should contain "specific-film-cast-name" with the text of "RIP CRAWFORD"
    And the page should contain "specific-film-genre" with the text of "Genre: Action"
    And the page should contain "specific-film-rental-rate" with the text of "Rental Rate: £4.99 for 3 weeks"
    And the page should contain "specific-film-score" with the text of "33.5 /100"

  Scenario: Update film redirect to update from specific actor page
    Given the page "http://localhost:5174/film/21" is loaded
    When the user selects "specific-film-update-link" link
    Then the URL should be "http://localhost:5174/updateFilm/21"

  Scenario: Update film redirect to all actors from specific actor page
    Given the page "http://localhost:5174/film/21" is loaded
    When the user selects "specific-film-all-films-link" link
    Then the URL should be "http://localhost:5174/films"

    #    need to add placeholder id
#  Scenario: Deleting a film
#    Given the page "http://localhost:5174/film/NEED TO PUT PLACEHOLDER" is loaded
#    When the user clicks the "specific-film-delete-button" button
#    Then the URL should be "http://localhost:5174/films"