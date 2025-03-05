Feature: FilmListPage
  Background:
    Given the page "http://localhost:5173/films" is loaded

  Scenario: the user clicks on create film
    When the user selects "createfilm-link" link
    Then the URL should be "http://localhost:5173/createFilm"

  Scenario: the user clicks on search films
    When the user selects "searchfilm-link" link
    Then the URL should be "http://localhost:5173/searchFilms"

  Scenario: the list of films should be displayed
    Then the page should contain "list-of-films"

  Scenario: the specific film is displayed
    Then the page should contain "movielist-title-4" with the text of "Affair Prejudice"
    And should contain "movielist-year-4" with the year of "1978"
    And should contain "movielist-desc-4" with the description of "A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank"
    And should contain "movielist-score-4" with the score of "44.62 /100"
    And should contain "movielist-moreinfo-4"

  Scenario: the moreinfo button redirects properly
    When the user selects "movielist-moreinfo-3" link
    Then the URL should be "http://localhost:5173/film/3"

