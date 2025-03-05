Feature: Create Actor Page
  Background:
    Given the page "http://localhost:5173/createActor" is loaded

  Scenario: Only filling out the first name field
    When the user enters "Tom" in the "actor-form-first-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Please fill out all fields."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: Only filling out the last name field
    When the user enters "Hanks" in the "actor-form-last-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Please fill out all fields."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: Only filling out the last name films field
    When the user enters "1" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Please fill out all fields."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: Clicking on the go back re-direct link
    When the user selects "actor-form-back-button" link
    Then the URL should be "http://localhost:5173/actors"

  Scenario: Submitting a valid actor
    When the user enters "Valid" in the "actor-form-first-name" field
    And the user enters "Actor" in the "actor-form-last-name" field
    And the user enters "1, 2, 3" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor created successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actors"

  Scenario: submitting an actor with a first name with more than 45 characters
    When the user enters more than 45 characters in the "actor-form-first-name" field
    And the user enters "b" in the "actor-form-last-name" field
    And the user enters "1" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "First name is limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: submitting an actor with a last name with more than 45 characters
    When the user enters "a" in the "actor-form-first-name" field
    And the user enters more than 45 characters in the "actor-form-last-name" field
    And the user enters "1" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Last name is limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: submitting an actor with first and last names with more than 45 characters
    When the user enters more than 45 characters in the "actor-form-first-name" field
    And the user enters more than 45 characters in the "actor-form-last-name" field
    And the user enters "1" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "First and Last name fields are limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: submitting an actor with empty films
    When the user enters "No" in the "actor-form-first-name" field
    And the user enters "Films" in the "actor-form-last-name" field
    And the user enters " " in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor created successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actors"

  Scenario: submitting an actor with films other than numbers
    When the user enters "Film" in the "actor-form-first-name" field
    And the user enters "Letters" in the "actor-form-last-name" field
    And the user enters "c" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor created successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actors"

  Scenario: submitting an actor with films containing numbers and letters
    When the user enters "Numbers" in the "actor-form-first-name" field
    And the user enters "Letters" in the "actor-form-last-name" field
    And the user enters "1, a, 2b, 3" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor created successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actors"
