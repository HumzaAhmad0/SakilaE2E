package org.example.actor;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.example.DriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;

import java.util.Objects;

import static org.testng.Assert.*;

public class SearchActorStepDefs {

//    I want to add a feature where it looks at the length of the already existing entry and then backspaces that many times
//   maybe a for loop for that size?
    @When("the user deletes the value in the {string} field")
    public void theUserDeletesValueInField(String field) {
        final var driver = DriverManager.getDriver();
        WebElement inputField = driver.findElement(By.cssSelector("input[data-testid='" + field + "']"));

        int inputContent = Objects.requireNonNull(inputField.getDomProperty("value")).length();
        inputField.click();
        for (int i = 0; i< inputContent; i++){
            inputField.sendKeys(Keys.BACK_SPACE);
        }
//        inputField.sendKeys(Keys.BACK_SPACE);
//        while (!inputField.getText().isEmpty()) {
//            inputField.sendKeys(Keys.BACK_SPACE);
//        }
    }

    @Then("the {string} field should be disabled")
    public void theFieldShouldBeDisabled(String field) {
        final var driver = DriverManager.getDriver();
        WebElement fieldElement = driver.findElement(By.cssSelector("input[data-testid='" + field + "']"));
        assertFalse(fieldElement.isEnabled());
    }

    @When("the user enters {string} in the {string} field")
    public void theUserEntersInField(String value, String field) {
        final var driver = DriverManager.getDriver();
        WebElement inputField = driver.findElement(By.cssSelector("input[data-testid='" + field + "']"));
        inputField.sendKeys(value);
    }

    @Then("the {string} field should be enabled")
    public void theFieldShouldBeEnabled(String field) {
        final var driver = DriverManager.getDriver();
        WebElement fieldElement = driver.findElement(By.cssSelector("input[data-testid='" + field + "']"));
        assertTrue(fieldElement.isEnabled());
    }

    @When("the user clicks the {string} button")
    public void theUserClicksTheButton(String button) {
        final var driver = DriverManager.getDriver();
        WebElement submitButton = driver.findElement(By.cssSelector("button[data-testid='" + button + "']"));
        submitButton.click();
    }

}
