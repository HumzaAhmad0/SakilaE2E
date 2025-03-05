Feature: Search Film Page
  Background:
    Given the page "http://localhost:5173/searchFilms" is loaded

  Scenario: the input fields are enabled initially
    Then the "film-search-id" field should be enabled
    And the "film-search-title" field should be enabled
    And the "film-search-genre" dropdown should be enabled
    And the "film-search-rating" dropdown should be enabled
    And the "film-search-release-year" field should be enabled
    And the "film-search-score" dropdown should be enabled

  Scenario: the user selects the go back link
    When the user selects "film-search-go-back" link
    Then the URL should be "http://localhost:5173/films"

  Scenario: fields disabled when id is filled
    When the user enters "1" in the "film-search-id" field
    Then the "film-search-title" field should be disabled
    And  the "film-search-genre" dropdown should be disabled
    And  the "film-search-rating" dropdown should be disabled
    And  the "film-search-release-year" field should be disabled
    And  the "film-search-score" dropdown should be disabled

  Scenario Outline: the user entering values into input and the correct fields being disabled
    When the user enters "<input>" in the "<field>" field
    Then the "film-search-id" field should be disabled

    Scenarios:
    | input  |             field              |
    |   A    |        film-search-title       |
    |  2003  |    film-search-release-year    |


  Scenario Outline: the user entering values into input and the correct fields being disabled (dropdowns)
    When the user selects "<input>" in the "<field>" dropdown
    Then the "film-search-id" field should be disabled

    Scenarios:
    | input  |             field              |
    | Action |        film-search-genre       |
    |   G    |        film-search-rating      |
    |   1    |        film-search-score       |

  Scenario: user searches with a valid ID
    When the user enters "111" in the "film-search-id" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "searched-film-id" with the text of "ID: 111"
    And the page should contain "searched-film-title" with the text of "CADDYSHACK JEDI"
    And the page should contain "searched-film-release-year" with the text of "2024"
    And the page should contain "searched-film-description" with the text of "A Awe-Inspiring Epistle of a Woman And a Madman who must Fight a Robot in Soviet Georgia"
    And the page should contain "searched-film-language" with the text of "Language: English"
    And the page should contain "searched-film-movie-length" with the text of "Run Time: 0h 52m"
    And the page should contain "searched-film-rating" with the text of "Rated: NC-17"
    And the page should contain "searched-film-cast-name-1" with the text of "Elvis Marx"
    And the page should contain "searched-film-genre-1" with the text of "Action"
    And the page should contain "searched-film-rental-rate" with the text of "Rental Rate: £0.99 for 3 weeks"
    And the page should contain "searched-film-score" with the text of "6.5 /100"

  Scenario: user searches with a valid ID and goes for specific cast
    When the user enters "111" in the "film-search-id" field
    And the user clicks the "film-search-submit-button" button
    When the user selects "searched-film-cast-name-1" link
    Then the URL should be "http://localhost:5173/actor/22"

  Scenario: user searches with a valid ID and goes for specific genre
    When the user enters "111" in the "film-search-id" field
    And the user clicks the "film-search-submit-button" button
    When the user selects "searched-film-genre-1" link
    Then the URL should be "http://localhost:5173/genre/Action"

  Scenario: user searches with a valid ID and goes for more info
    When the user enters "111" in the "film-search-id" field
    And the user clicks the "film-search-submit-button" button
    When the user selects "searched-film-more-info" link
    Then the URL should be "http://localhost:5173/film/111"

  Scenario: user searches with a invalid ID
    When the user enters "11111" in the "film-search-id" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "film-search-error-message" with the text of "Film not found, ERROR 404"

  Scenario: user searches with a invalid title
    When the user enters "asdsads" in the "film-search-title" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "film-search-no-results" with the text of "No results found"

  Scenario: user searches with a valid title
    When the user enters "tes" in the "film-search-title" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "movielist-title-1" with the text of "Greatest North"
    And the page should contain "movielist-title-2" with the text of "Maltese Hope"
    And the page should contain "movielist-title-3" with the text of "Pirates Roxanne"
    And the page should contain "movielist-title-4" with the text of "Twisted Pirates"

  Scenario: user searches with a valid title
    When the user enters "2036" in the "film-search-release-year" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "movielist-title-1" with the text of "Alabama Devil"
    And the page should contain "movielist-title-2" with the text of "Arabia Dogma"

  Scenario: user searches with sort by score using 1
    When the user selects "1" in the "film-search-score" dropdown
    And the user clicks the "film-search-submit-button" button
    And the page should contain "movielist-title-1" with the text of "Slums Duck"
    And the page should contain "movielist-title-2" with the text of "Right Cranes"
    And the page should contain "movielist-title-3" with the text of "Halloween Nuts"
    And the page should contain "movielist-title-4" with the text of "Midnight Westward"
    And the page should contain "movielist-title-5" with the text of "Freaky Pocus"

  Scenario: user searches with sort by score using 2
    When the user selects "2" in the "film-search-score" dropdown
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "movielist-title-1" with the text of "Pearl Destiny"
    And the page should contain "movielist-title-2" with the text of "Bonnie Holocaust"
    And the page should contain "movielist-title-3" with the text of "Grosse Wonderful"
    And the page should contain "movielist-title-4" with the text of "Notting Speakeasy"
    And the page should contain "movielist-title-5" with the text of "Amelie Hellfighters"

  Scenario: user searches with multiple params
    When the user enters "a" in the "film-search-title" field
    And the user selects "Action" in the "film-search-genre" dropdown
    And the user selects "G" in the "film-search-rating" dropdown
    When the user enters "1985" in the "film-search-release-year" field
    And the user selects "2" in the "film-search-score" dropdown
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "movielist-title-1" with the text of "Casualties Encino"
    And the page should contain "movielist-title-2" with the text of "Bull Shawshank"

  Scenario: user searches with multiple params (incorrect)
    When the user enters "a" in the "film-search-title" field
    And the user selects "Action" in the "film-search-genre" dropdown
    And the user selects "PG-13" in the "film-search-rating" dropdown
    When the user enters "1985" in the "film-search-release-year" field
    And the user selects "2" in the "film-search-score" dropdown
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "film-search-no-results" with the text of "No results found"