Feature: Update Film Page
  Background:
    Given the page "http://localhost:5173/updateFilm/4" is loaded

  Scenario: Clicking on the reset button
    When the user deletes the value in the "film-form-title" field
    And the user deletes the value in the "film-form-description" textarea
    And the user deletes the value in the "film-form-cast" field
    And the user deletes the value in the "film-form-genres" field
    And the user clicks the "reset-update-film-page-button" button
    Then the URL should be "http://localhost:5173/updateFilm/4"
    And the page should contain input "film-form-title" with the text of "AFFAIR PREJUDICE"
    And the page should contain input "film-form-description" with the text of "A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank"
    And the page should contain input "film-form-cast" with the text of "41, 81, 88, 147, 162"
    And the page should contain input "film-form-genres" with the text of "11"
    And the page should contain input "film-form-score" with the text of "44.62"
    And the page should contain input "film-form-rental_rate" with the text of "2.99"

  Scenario: Updating only the film title
    When the user deletes the value in the "film-form-title" field
    And the user enters "A" in the "film-form-title" field
    And the user clicks the "film-form-submit-button" button
    Then an alert should be shown with the message "Film updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/film/4"
    And the page should contain "specific-film-title" with the text of "A"

  Scenario: Updating only the film title (with invalid input [more than 128 chars])
    When the user deletes the value in the "film-form-title" field
    And the user enters more than 128 characters in the "film-form-title" field
    And the user clicks the "film-form-submit-button" button
    Then an alert should be shown with the message "Title is limited to 128 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/updateFilm/4"

  Scenario: Updating only the film description
    When the user deletes the value in the "film-form-description" textarea
    And the user enters "B" in the "film-form-description" textarea
    And the user clicks the "film-form-submit-button" button
    Then an alert should be shown with the message "Film updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/film/4"
    And the page should contain "specific-film-description" with the text of "B"

  Scenario: Updating only the film cast
    When the user deletes the value in the "film-form-cast" field
    And the user enters "81" in the "film-form-cast" field
    And the user clicks the "film-form-submit-button" button
    Then an alert should be shown with the message "Film updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/film/4"
    And the page should contain "specific-film-cast-name-1" with the text of "Scarlett Damon"

  Scenario: Updating only the film genres
    When the user deletes the value in the "film-form-genres" field
    And the user enters "12" in the "film-form-genres" field
    And the user clicks the "film-form-submit-button" button
    Then an alert should be shown with the message "Film updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/film/4"
    And the page should contain "specific-film-genre-1" with the text of "Music"

  Scenario: Updating all fields for the film
    When the user deletes the value in the "film-form-title" field
    And the user deletes the value in the "film-form-description" textarea
    And the user deletes the value in the "film-form-cast" field
    And the user deletes the value in the "film-form-genres" field
    And the user enters "AFFAIR PREJUDICE" in the "film-form-title" field
    And the user enters "A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank" in the "film-form-description" textarea
    And the user enters "41, 81, 88, 147, 162" in the "film-form-cast" field
    And the user enters "11" in the "film-form-genres" field
    And the user clicks the "film-form-submit-button" button
    Then an alert should be shown with the message "Film updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/film/4"
    And the page should contain "specific-film-title" with the text of "AFFAIR PREJUDICE"
    And the page should contain "specific-film-description" with the text of "A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank"
    And the page should contain "specific-film-cast-name-1" with the text of "Jodie Degeneres"
    And the page should contain "specific-film-cast-name-2" with the text of "Scarlett Damon"
    And the page should contain "specific-film-cast-name-3" with the text of "Kenneth Pesci"
    And the page should contain "specific-film-cast-name-4" with the text of "Fay Winslet"
    And the page should contain "specific-film-cast-name-5" with the text of "Oprah Kilmer"
    And the page should contain "specific-film-genre-1" with the text of "Horror"

  Scenario: Clicking on the go back re-direct link
    When the user selects "film-form-back-button" link
    Then the URL should be "http://localhost:5173/films"
