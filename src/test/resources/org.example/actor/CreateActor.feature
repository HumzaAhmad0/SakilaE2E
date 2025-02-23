Feature: Create Film Page

  Scenario: Only filling out the first name field
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters "A" in the "actor-form-first-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Please fill out all fields."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: Only filling out the last name field
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters "B" in the "actor-form-last-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Please fill out all fields."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: Only filling out the last name films field
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters "1" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Please fill out all fields."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: Clicking on the go back re-direct link
    Given the page "http://localhost:5173/createActor" is loaded
    When the user selects "actor-form-back-button" link
    Then the URL should be "http://localhost:5173/actors"

  Scenario: Submitting a valid actor
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters "Valid" in the "actor-form-first-name" field
    And the user enters "Actor" in the "actor-form-last-name" field
    And the user enters "1, 2, 3" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor created successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actors"

  Scenario: submitting an actor with a first name with more than 45 characters
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters more than 45 characters in the "actor-form-first-name" field
    And the user enters "b" in the "actor-form-last-name" field
    And the user enters "1" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "First name is limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: submitting an actor with a last name with more than 45 characters
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters "a" in the "actor-form-first-name" field
    And the user enters more than 45 characters in the "actor-form-last-name" field
    And the user enters "1" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Last name is limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: submitting an actor with first and last names with more than 45 characters
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters more than 45 characters in the "actor-form-first-name" field
    And the user enters more than 45 characters in the "actor-form-last-name" field
    And the user enters "1" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "First and Last name fields are limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/createActor"

  Scenario: submitting an actor with empty films
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters "a" in the "actor-form-first-name" field
    And the user enters "b" in the "actor-form-last-name" field
    And the user enters " " in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor created successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actors"

  Scenario: submitting an actor with films other than numbers
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters "a" in the "actor-form-first-name" field
    And the user enters "b" in the "actor-form-last-name" field
    And the user enters "c" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor created successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actors"

  Scenario: submitting an actor with films containing numbers and letters
    Given the page "http://localhost:5173/createActor" is loaded
    When the user enters "a" in the "actor-form-first-name" field
    And the user enters "b" in the "actor-form-last-name" field
    And the user enters "1, a, 2b, 3" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor created successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actors"
