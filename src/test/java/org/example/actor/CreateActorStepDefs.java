package org.example.actor;

import io.cucumber.java.en.When;
import org.example.DriverManager;
import io.cucumber.java.en.Then;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.testng.Assert.assertEquals;

public class CreateActorStepDefs {

    @Then("an alert should be shown with the message {string}")
    public void an_alert_should_be_shown_with_the_message(String alertMessage) {
        final var driver = DriverManager.getDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        Alert alert = wait.until(ExpectedConditions.alertIsPresent());

        String alertText = alert.getText();
        assertEquals(alertText, alertMessage);
    }

    @Then("the user clicks ok on the alert")
    public void the_user_clicks_ok_on_the_alert() {
        final var driver = DriverManager.getDriver();
        Alert alert = driver.switchTo().alert();
        alert.accept();
    }

    @When("the user enters more than {int} characters in the {string} field")
    public void the_user_enters_more_than_X_characters_in_the_field(int length,String field) {
        final var driver = DriverManager.getDriver();
        String longName = "A".repeat(length+1);
        WebElement inputField = driver.findElement(By.cssSelector("input[data-testid='" + field + "']"));
        inputField.sendKeys(longName);
    }

}
