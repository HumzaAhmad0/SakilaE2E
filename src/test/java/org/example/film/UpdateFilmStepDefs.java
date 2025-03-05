package org.example.film;

import io.cucumber.java.en.When;
import org.example.DriverManager;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class UpdateFilmStepDefs {

    @When("the user deletes the value in the {string} textarea")
    public void theUserDeletesValueInTextarea(String field) {
        final var driver = DriverManager.getDriver();

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
        WebElement textareaField = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("textarea[data-testid='" + field + "']")));
        wait.until(ExpectedConditions.visibilityOf(textareaField));

        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView({ behavior: 'smooth', block: 'center' });", textareaField);

        textareaField.click();

        textareaField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
        textareaField.sendKeys(Keys.BACK_SPACE);

    }

    @When("the user enters {string} in the {string} textarea")
    public void theUserEntersInTextarea(String value, String field) {
        final var driver = DriverManager.getDriver();

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
        WebElement textareaField = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("textarea[data-testid='" + field + "']")));
        wait.until(ExpectedConditions.visibilityOf(textareaField));

        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView({ behavior: 'smooth', block: 'center' });", textareaField);

        textareaField.click();

        textareaField.sendKeys(value);
    }

    @When("the user enters more than {int} characters in the {string} textarea")
    public void theUserEntersMoreThanXCharactersInField(int length, String field) {
        final var driver = DriverManager.getDriver();

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
        WebElement textareaField = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("[data-testid='" + field + "']")));
        wait.until(ExpectedConditions.visibilityOf(textareaField));

        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView({ behavior: 'smooth', block: 'center' });", textareaField);

        String longName = "A".repeat(length + 1);

        textareaField.click();
        textareaField.sendKeys(longName);
    }

}
