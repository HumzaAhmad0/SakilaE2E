Feature: Search Film Page

  Scenario: the input fields are enabled initially
    Given the page "http://localhost:5173/searchFilms" is loaded
    Then the "film-search-id" field should be enabled
    And the "film-search-title" field should be enabled
    And the "film-search-genre" dropdown should be enabled
    And the "film-search-rating" dropdown should be enabled
    And the "film-search-release-year" field should be enabled
    And the "film-search-score" dropdown should be enabled

  Scenario: the user selects the go back link
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user selects "film-search-go-back" link
    Then the URL should be "http://localhost:5173/films"

  Scenario: fields disabled when id is filled
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user enters "1" in the "film-search-id" field
    Then the "film-search-title" field should be disabled
    And  the "film-search-genre" dropdown should be disabled
    And  the "film-search-rating" dropdown should be disabled
    And  the "film-search-release-year" field should be disabled
    And  the "film-search-score" dropdown should be disabled

  Scenario Outline: the user entering values into input and the correct fields being disabled
    Given the page "http://localhost:5175/searchFilms" is loaded
    When the user enters "<input>" in the "<field>" field
    Then the "film-search-id" field should be disabled

    Scenarios:
    | input  |             field              |
    |   A    |        film-search-title       |
    |  2003  |    film-search-release-year    |


  Scenario Outline: the user entering values into input and the correct fields being disabled (dropdowns)
    Given the page "http://localhost:5175/searchFilms" is loaded
    When the user selects "<input>" in the "<field>" dropdown
    Then the "film-search-id" field should be disabled

    Scenarios:
    | input  |             field              |
    | Action |        film-search-genre       |
    |   G    |        film-search-rating      |
    |   1    |        film-search-score       |

  Scenario: user searches with a valid ID
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user enters "111" in the "film-search-id" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "searched-film-id" with the text of "111"
    And the page should contain "searched-film-title" with the text of "CADDYSHACK JEDI"
    And the page should contain "searched-film-release-year" with the text of "2024"
    And the page should contain "searched-film-description" with the text of "A Awe-Inspiring Epistle of a Woman And a Madman who must Fight a Robot in Soviet Georgia"
    And the page should contain "searched-film-language" with the text of "Language: English"
    And the page should contain "searched-film-movie-length" with the text of "Run Time: 0h 52m"
    And the page should contain "searched-film-rating" with the text of "Rated: NC-17"
    And the page should contain "searched-film-cast-name" with the text of "ELVIS MARX"
    And the page should contain "searched-film-genre" with the text of "Genre: Action"
    And the page should contain "searched-film-rental-rate" with the text of "Rental Rate: £0.99 for 3 weeks"
    And the page should contain "searched-film-score" with the text of "6.5 /100"

  Scenario: user searches with a valid ID and goes for more info
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user enters "111" in the "film-search-id" field
    And the user clicks the "film-search-submit-button" button
    When the user selects "searched-film-more-info" link
    Then the URL should be "http://localhost:5173/film/111"

  Scenario: user searches with a invalid ID
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user enters "11111" in the "film-search-id" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "film-search-error-message" with the text of "Film not found, ERROR 404"

  Scenario: user searches with a invalid title
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user enters "asdsads" in the "film-search-title" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "film-search-no-results" with the text of "No results found"

  Scenario: user searches with a valid title
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user enters "test" in the "film-search-title" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "movielist-title-1" with the text of "testinggggg"
    And the page should contain "movielist-title-2" with the text of "GREATEST NORTH"

  Scenario: user searches with a valid title
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user enters "2036" in the "film-search-release-year" field
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "movielist-title-1" with the text of "ALABAMA DEVIL"
    And the page should contain "movielist-title-2" with the text of "ARABIA DOGMA"

  Scenario: user searches with sort by score using 1
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user selects "1" in the "film-search-score" dropdown
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "movielist-title-1" with the text of "NUM"
    And the page should contain "movielist-title-2" with the text of "SLUMS DUCK"
    And the page should contain "movielist-title-3" with the text of "RIGHT CRANES"
    And the page should contain "movielist-title-4" with the text of "HALLOWEEN NUTS"
    And the page should contain "movielist-title-5" with the text of "MIDNIGHT WESTWARD"

  Scenario: user searches with sort by score using 2
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user selects "2" in the "film-search-score" dropdown
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "movielist-title-1" with the text of "PEARL DESTINY"
    And the page should contain "movielist-title-2" with the text of "BONNIE HOLOCAUST"
    And the page should contain "movielist-title-3" with the text of "GROSSE WONDERFUL"
    And the page should contain "movielist-title-4" with the text of "NOTTING SPEAKEASY"
    And the page should contain "movielist-title-5" with the text of "abc"

  Scenario: user searches with multiple params
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user enters "a" in the "film-search-title" field
    And the user selects "Action" in the "film-search-genre" dropdown
    And the user selects "G" in the "film-search-rating" dropdown
    When the user enters "1985" in the "film-search-release-year" field
    And the user selects "2" in the "film-search-score" dropdown
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "movielist-title-1" with the text of "CASUALTIES ENCINO"
    And the page should contain "movielist-title-2" with the text of "BULL SHAWSHANK"

  Scenario: user searches with multiple params (incorrect)
    Given the page "http://localhost:5173/searchFilms" is loaded
    When the user enters "a" in the "film-search-title" field
    And the user selects "Action" in the "film-search-genre" dropdown
    And the user selects "PG-13" in the "film-search-rating" dropdown
    When the user enters "1985" in the "film-search-release-year" field
    And the user selects "2" in the "film-search-score" dropdown
    And the user clicks the "film-search-submit-button" button
    Then the page should contain "film-search-no-results" with the text of "No results found"