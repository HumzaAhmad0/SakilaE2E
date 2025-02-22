Feature: FilmListPage

  Scenario: the user clicks on create film
    Given the page "http://localhost:5174/films" is loaded
    When the user selects "createfilm-link" link
    Then the URL should be "http://localhost:5174/createFilm"

  Scenario: the user clicks on search films
    Given the page "http://localhost:5174/films" is loaded
    When the user selects "searchfilm-link" link
    Then the URL should be "http://localhost:5174/searchFilms"

  Scenario: the list of films should be displayed
    Given the page "http://localhost:5174/films" is loaded
    Then the page should contain "list-of-films"


  Scenario: the specific film is displayed
    Given the page "http://localhost:5174/films" is loaded
    Then the page should contain "movielist-title-3" with the text of "AMERICAN CIRCUS"
    And should contain "movielist-year-3" with the year of "1993"
    And should contain "movielist-desc-3" with the description of "A Insightful Drama of a Girl And a Astronaut who must Face a Database Administrator in A Shark Tank"
    And should contain "movielist-score-3" with the score of "33.5 /100"
    And should contain "movielist-moreinfo-3"

  Scenario: the moreinfo button redirects properly
    Given the page "http://localhost:5174/films" is loaded
    When the user selects "movielist-moreinfo-3" link
    Then the URL should be "http://localhost:5174/film/21"

