Feature: FilmListPage

  Scenario: the user clicks on create film
    Given the page "http://localhost:5174/films" is loaded
    When the user selects "createfilm-link" link
    Then the URL should be "http://localhost:5174/createFilm"

  Scenario: the user clicks on search films
    Given the page "http://localhost:5174/films" is loaded
    When the user selects "searchfilm-link" link
    Then the URL should be "http://localhost:5174/searchFilms"
#
#  Scenario: the films are displayed
#    Given the URL should be "http://localhost:5174/films"
#    Then the page should have