package actor;

import driver.DriverManager;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.testng.Assert.*;

public class SearchActorStepDefs {

//    @When("the user deletes the value in the {string} field")
//    public void theUserDeletesValueInField(String field) {
//        final var driver = driver.DriverManager.getDriver();
//        WebElement inputField = driver.findElement(By.cssSelector("input[data-testid='" + field + "']"));
//
//        int inputContent = Objects.requireNonNull(inputField.getDomProperty("value")).length();
//        inputField.click();
//        for (int i = 0; i< inputContent; i++){
//            inputField.sendKeys(Keys.BACK_SPACE);
//        }
//    }

    @When("the user deletes the value in the {string} field")
    public void theUserDeletesValueInField(String field) {
        final var driver = DriverManager.getDriver();

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
        WebElement inputField = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[data-testid='" + field + "']")));
        wait.until(ExpectedConditions.visibilityOf(inputField));

        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView({ behavior: 'smooth', block: 'center' });", inputField);

        inputField.click();

        inputField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
        inputField.sendKeys(Keys.BACK_SPACE);

//        int inputContent = Objects.requireNonNull(inputField.getDomProperty("value")).length();
//        for (int i = 0; i < inputContent; i++) {
//            inputField.sendKeys(Keys.BACK_SPACE);
//        }
    }



    @Then("the {string} field should be disabled")
    public void theFieldShouldBeDisabled(String field) {
        final var driver = DriverManager.getDriver();
        WebElement fieldElement = driver.findElement(By.cssSelector("input[data-testid='" + field + "']"));
        assertFalse(fieldElement.isEnabled());
    }

//    @When("the user enters {string} in the {string} field")
//    public void theUserEntersInField(String value, String field) {
//        final var driver = driver.DriverManager.getDriver();
//        WebElement inputField = driver.findElement(By.cssSelector("[data-testid='" + field + "']"));
//        inputField.sendKeys(value);
//    }

    @When("the user enters {string} in the {string} field")
    public void theUserEntersInField(String value, String field) {
        final var driver = DriverManager.getDriver();

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        WebElement inputField = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("[data-testid='" + field + "']")));
        wait.until(ExpectedConditions.visibilityOf(inputField));

        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView({ behavior: 'smooth', block: 'center' });", inputField);

        inputField.click();

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

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
        WebElement linkElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("button[data-testid='" + button + "']")));
        wait.until(ExpectedConditions.visibilityOf(linkElement));

        ((JavascriptExecutor) driver).executeScript(
                "arguments[0].scrollIntoView({ behavior: 'smooth', block: 'center' });", linkElement);

        wait.until(ExpectedConditions.elementToBeClickable(linkElement));

        try {
            linkElement.click();
        } catch (ElementClickInterceptedException e) {
            System.out.println("Click intercepted, attempting JavaScript click...");
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", linkElement);
        }

        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
