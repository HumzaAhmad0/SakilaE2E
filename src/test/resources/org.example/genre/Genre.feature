Feature:

  Scenario: the list of genres should be displayed
    Given the page "http://localhost:5174/genres" is loaded
    Then the page should contain "list-of-genres"

  Scenario: the specific genre is displayed
    Given the page "http://localhost:5174/genres" is loaded
    Then the page should contain "genre-name-3" with the text of "Children"
    And should contain "genre-movielist-3"

  Scenario: the movie list link redirects properly
    Given the page "http://localhost:5174/genres" is loaded
    When the user selects "genre-movielist-3" link
    Then the URL should be "http://localhost:5174/genre/Children"