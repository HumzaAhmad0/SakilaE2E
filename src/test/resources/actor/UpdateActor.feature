Feature: Update actor page
  Background:
    Given the page "http://localhost:5173/updateActor/3" is loaded

  Scenario: Clicking on the reset button
    When the user deletes the value in the "actor-form-first-name" field
    And the user deletes the value in the "actor-form-last-name" field
    And the user deletes the value in the "actor-form-film-list" field
    And the user clicks the "reset-update-actor-page-button" button
    Then the URL should be "http://localhost:5173/updateActor/3"
    And the page should contain input "actor-form-first-name" with the text of "MORISSON"
    And the page should contain input "actor-form-last-name" with the text of "HOLMES"
    And the page should contain input "actor-form-film-list" with the text of "2, 6, 9, 12"
#
  Scenario: Updating only the actors first name
    When the user deletes the value in the "actor-form-first-name" field
    And the user enters "B" in the "actor-form-first-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actor/3"
    And the page should contain "specific-actor-full-name" with the text of "B HOLMES"

  Scenario: Updating only the actors first name (with invalid input [more than 45 chars])
    When the user deletes the value in the "actor-form-first-name" field
    And the user enters more than 45 characters in the "actor-form-first-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "First name is limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/updateActor/3"

  Scenario: Updating only the actors last name
    When the user deletes the value in the "actor-form-last-name" field
    And the user enters "C" in the "actor-form-last-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actor/3"
    And the page should contain "specific-actor-full-name" with the text of "B C"

  Scenario: Updating only the actors last name (with invalid input [more than 45 chars])
    When the user deletes the value in the "actor-form-last-name" field
    And the user enters more than 45 characters in the "actor-form-last-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Last name is limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/updateActor/3"

  Scenario: Updating the actors names (with invalid input [more than 45 chars])
    When the user deletes the value in the "actor-form-first-name" field
    And the user deletes the value in the "actor-form-last-name" field
    And the user enters more than 45 characters in the "actor-form-first-name" field
    And the user enters more than 45 characters in the "actor-form-last-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "First and Last name fields are limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/updateActor/3"

  Scenario: Updating only the actors films
    When the user deletes the value in the "actor-form-film-list" field
    And the user enters "2" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actor/3"
    And the page should contain "specific-actor-film-titles-1" with the text of "Ace Goldfinger"

  Scenario: Updating all fields for the actor
    When the user deletes the value in the "actor-form-first-name" field
    And the user deletes the value in the "actor-form-last-name" field
    And the user deletes the value in the "actor-form-film-list" field
    And the user enters "A" in the "actor-form-first-name" field
    And the user enters "B" in the "actor-form-last-name" field
    And the user enters "3" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actor/3"
    And the page should contain "specific-actor-full-name" with the text of "A B"
    And the page should contain "specific-actor-film-titles-1" with the text of "Adaptation Holes"

  Scenario: Clicking on the go back re-direct link
    When the user selects "actor-form-back-button" link
    Then the URL should be "http://localhost:5173/actors"

#adding just for resetting the actor
  Scenario: Updating the actors back to the original
    When the user deletes the value in the "actor-form-first-name" field
    And the user enters "MORISSON" in the "actor-form-first-name" field
    And the user deletes the value in the "actor-form-last-name" field
    And the user enters "HOLMES" in the "actor-form-last-name" field
    And the user deletes the value in the "actor-form-film-list" field
    And the user enters "2, 6, 9, 12" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actor/3"