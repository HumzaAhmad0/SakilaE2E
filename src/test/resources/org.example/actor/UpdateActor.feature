Feature: Update actor page

# DOESNT WORK

#  Scenario: Clicking on the reset button
#    Given the page "http://localhost:5173/updateActor/3" is loaded
#    When the user deletes the value in the "actor-form-first-name" field
#    And the user deletes the value in the "actor-form-last-name" field
#    And the user deletes the value in the "actor-form-film-list" field
#    And the user clicks the "reset-update-actor-page-button" button
#    Then the URL should be "http://localhost:5173/updateActor/3"
#    And the page should contain "actor-form-first-name" with the text of "A"
#    And the page should contain "actor-form-last-name" with the text of "B"
#    And the page should contain "actor-form-film-list" with the text of "3"

  Scenario: Updating only the actors first name
    Given the page "http://localhost:5173/updateActor/3" is loaded
    When the user deletes the value in the "actor-form-first-name" field
    And the user enters "B" in the "actor-form-first-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actor/3"
    And the page should contain "specific-actor-first-name" with the text of "B"

  Scenario: Updating only the actors first name (with invalid input [more than 45 chars])
    Given the page "http://localhost:5173/updateActor/3" is loaded
    When the user deletes the value in the "actor-form-first-name" field
    And the user enters more than 45 characters in the "actor-form-first-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "First name is limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/updateActor/3"

  Scenario: Updating only the actors last name
    Given the page "http://localhost:5173/updateActor/3" is loaded
    When the user deletes the value in the "actor-form-last-name" field
    And the user enters "C" in the "actor-form-last-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actor/3"
    And the page should contain "specific-actor-last-name" with the text of "C"

  Scenario: Updating only the actors last name (with invalid input [more than 45 chars])
    Given the page "http://localhost:5173/updateActor/3" is loaded
    When the user deletes the value in the "actor-form-last-name" field
    And the user enters more than 45 characters in the "actor-form-last-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Last name is limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/updateActor/3"

  Scenario: Updating the actors names (with invalid input [more than 45 chars])
    Given the page "http://localhost:5173/updateActor/3" is loaded
    When the user deletes the value in the "actor-form-first-name" field
    And the user deletes the value in the "actor-form-last-name" field
    And the user enters more than 45 characters in the "actor-form-first-name" field
    And the user enters more than 45 characters in the "actor-form-last-name" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "First and Last name fields are limited to 45 characters."
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/updateActor/3"

  Scenario: Updating only the actors films
    Given the page "http://localhost:5173/updateActor/3" is loaded
    When the user deletes the value in the "actor-form-film-list" field
    And the user enters "2" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actor/3"
    And the page should contain "specific-actor-film-titles" with the text of "ACE GOLDFINGER"

  Scenario: Updating all fields for the actor
    Given the page "http://localhost:5173/updateActor/3" is loaded
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
    And the page should contain "specific-actor-first-name" with the text of "A"
    And the page should contain "specific-actor-last-name" with the text of "B"
    And the page should contain "specific-actor-film-titles" with the text of "ADAPTATION HOLES"


  Scenario: Clicking on the go back re-direct link
    Given the page "http://localhost:5173/updateActor/3" is loaded
    When the user selects "actor-form-back-button" link
    Then the URL should be "http://localhost:5173/actors"


#adding just for resetting the actor
  Scenario: Updating the actors back to the og
    Given the page "http://localhost:5173/updateActor/3" is loaded
    When the user deletes the value in the "actor-form-first-name" field
    And the user enters "A" in the "actor-form-first-name" field
    And the user deletes the value in the "actor-form-last-name" field
    And the user enters "B" in the "actor-form-last-name" field
    And the user deletes the value in the "actor-form-film-list" field
    And the user enters "3" in the "actor-form-film-list" field
    And the user clicks the "actor-form-submit-button" button
    Then an alert should be shown with the message "Actor updated successfully!"
    And the user clicks ok on the alert
    Then the URL should be "http://localhost:5173/actor/3"