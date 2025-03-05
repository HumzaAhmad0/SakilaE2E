Feature:
  Background:
    Given the page "http://localhost:5173/genres" is loaded

  Scenario: the list of genres should be displayed
    Then the page should contain "list-of-genres"

  Scenario: the specific genre is displayed
    Then the page should contain "genre-name-3" with the text of "Children"
    And should contain "genre-movie-list-3"

  Scenario: the movie list link redirects properly
    When the user selects "genre-movie-list-3" link
    Then the URL should be "http://localhost:5173/genre/Children"

#  Scenario: the movie list link redirects properly
#    When the user selects "genre-movie-list-3" link
#    And the user selects "back-to-genres-link" link
#    Then the URL should be "http://localhost:5173/genres"
#
#  Scenario: the movie list link redirects properly
#    When the user selects "genre-movie-list-3" link
#    And the user selects "movielist-moreinfo-1" link
#    Then the URL should be "http://localhost:5173/film/1"