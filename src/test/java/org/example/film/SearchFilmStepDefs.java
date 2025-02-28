package org.example.film;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.example.DriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import static org.testng.Assert.assertFalse;
import static org.testng.Assert.assertTrue;

public class SearchFilmStepDefs {

    @When("the user selects {string} in the {string} dropdown")
    public void theUserSelectsInDropdown(String value, String field) {
        final WebDriver driver = DriverManager.getDriver();
        WebElement dropdown = driver.findElement(By.cssSelector("select[data-testid='" + field + "']"));
        Select select = new Select(dropdown);
        select.selectByVisibleText(value);
    }

    @Then("the {string} dropdown should be enabled")
    public void theDropdownShouldBeEnabled(String field) {
        final var driver = DriverManager.getDriver();
        WebElement dropdownElement = driver.findElement(By.cssSelector("select[data-testid='" + field + "']"));
        assertTrue(dropdownElement.isEnabled());
    }

    @Then("the {string} dropdown should be disabled")
    public void theDropdownShouldBeDisabled(String field) {
        final var driver = DriverManager.getDriver();
        WebElement dropdownElement = driver.findElement(By.cssSelector("select[data-testid='" + field + "']"));
        assertFalse(dropdownElement.isEnabled());
    }

}
