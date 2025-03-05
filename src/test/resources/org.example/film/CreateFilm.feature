Feature: Create Film Page

#  Scenario: Only filling out the title field
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "A" in the "film-form-title" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Please fill out the description field."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Only filling out the description field
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "A" in the "film-form-description" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Please fill out the title field."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Only filling out the cast field
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "1, 2, 3" in the "film-form-cast" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Please fill out the title field."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Only filling out the genres field
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "1, 2" in the "film-form-genres" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Please fill out the title field."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Only filling out the score field
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "90" in the "film-form-score" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Please fill out all fields."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Only filling out the rental rate field
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "2.99" in the "film-form-rental_rate" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Please fill out all fields."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Clicking on the go back re-direct link
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user selects "film-form-back-button" link
#    Then the URL should be "http://localhost:5173/films"
#
#  Scenario: Submitting a valid film
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "Valid Film" in the "film-form-title" field
#    And the user enters "A great description" in the "film-form-description" field
#    And the user enters "1, 2, 3" in the "film-form-cast" field
#    And the user enters "1, 2" in the "film-form-genres" field
#    And the user enters "90" in the "film-form-score" field
#    And the user enters "2.99" in the "film-form-rental_rate" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Film created successfully!"
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/films"
#
#  Scenario: Submitting a film with a title longer than 128 characters
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters more than 128 characters in the "film-form-title" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Title is limited to 128 characters."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with a release year greater than 2155
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "2156" in the "film-form-release_year" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Release Year has to be within the range of 1901-2155"
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
##
#  Scenario: Submitting a film with a release year less than 1901
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "1800" in the "film-form-release_year" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Release Year has to be within the range of 1901-2155"
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with a language greater than 16
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "7" in the "film-form-language" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Language ID must be between 1 and 16."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
##
#  Scenario: Submitting a film with a language less than 1
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user deletes the value in the "film-form-language" field
#    When the user enters "0" in the "film-form-language" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Language ID must be between 1 and 16."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with a duration greater than 32767
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "35000" in the "film-form-duration" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Movie Duration must be between 1 and 32767 minutes."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with a duration less than 1
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user deletes the value in the "film-form-duration" field
#    When the user enters "0" in the "film-form-duration" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Movie Duration must be between 1 and 32767 minutes."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with a blank rating
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user selects "" in the "film-form-rating" dropdown
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Please select a rating."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#


  Scenario: Submitting a film with a cast containing non-numeric values
    Given the page "http://localhost:5173/createFilm" is loaded
    When the user enters "Valid Film" in the "film-form-title" field
    And the user enters "A great description" in the "film-form-description" field
    And the user enters "a, b, c" in the "film-form-cast" field
    And the user enters "1, 2" in the "film-form-genres" field
    And the user enters "90" in the "film-form-score" field
    And the user enters "2.99" in the "film-form-rental_rate" field
    And the user clicks the "film-form-submit-button" button
    Then an alert should be shown with the message "Film created successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/films"

  Scenario: Submitting a film with a genre containing non-numeric values
    Given the page "http://localhost:5173/createFilm" is loaded
    When the user enters "a, b, c" in the "film-form-genres" field
    And the user clicks the "film-form-submit-button" button
    Then an alert should be shown with the message "Genre IDs must be numbers."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with a genre containing numbers and letters
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "1, 2a, 3" in the "film-form-genres" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Genre IDs must be numbers."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with a genre number greater than 16
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "17" in the "film-form-genres" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Genre IDs must be between 1 and 16."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with a genre number less than 1
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "0" in the "film-form-genres" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Genre IDs must be between 1 and 16."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with rental rate greater than 99.99
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "100.00" in the "film-form-rental_rate" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Rental Rate must be between 0.00 and 99.99."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with rental rate less than 0
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "-1" in the "film-form-rental_rate" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Rental Rate must be between 0.00 and 99.99."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with score greater than 100
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "101" in the "film-form-score" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Score must be between 0 and 100."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with score less than 0
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "-1" in the "film-form-score" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Score must be between 0 and 100."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"
#
#  Scenario: Submitting a film with rental duration greater than 255
#    Given the page "http://localhost:5173/createFilm" is loaded
#    When the user enters "256" in the "film-form-rental_duration" field
#    And the user clicks the "film-form-submit-button" button
#    Then an alert should be shown with the message "Rental Duration must be between 1 and 255."
#    And the user clicks ok on the alert
#    Then the URL should be "http://localhost:5173/createFilm"



