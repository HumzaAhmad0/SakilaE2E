Feature:
  Scenario: the user clicks on go back
    Given the page "http://localhost:5174/genre/Children" is loaded
    When the user selects "back-to-genres-link" link
    Then the URL should be "http://localhost:5174/genres"

  Scenario: the list of films should be displayed
    Given the page "http://localhost:5174/genre/Children" is loaded
    Then the page should contain "list-of-movies-of-specific-genre"

  Scenario: the specific film is displayed
    Given the page "http://localhost:5174/genre/Children" is loaded
    Then the page should contain "movielist-title-3" with the text of "BEAR GRACELAND"
    And should contain "movielist-year-3" with the year of "1997"
    And should contain "movielist-desc-3" with the description of "A Astounding Saga of a Dog And a Boy who must Kill a Teacher in The First Manned Space Station"
    And should contain "movielist-score-3" with the score of "9.25 /100"
    And should contain "movielist-moreinfo-3"

  Scenario: the moreinfo button redirects properly
    Given the page "http://localhost:5174/genre/Children" is loaded
    When the user selects "movielist-moreinfo-3" link
    Then the URL should be "http://localhost:5174/film/59"