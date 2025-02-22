package org.example;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.Assert;

import java.time.Duration;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

public class GenericStepDefs {
    protected WebDriver driver;

    @After
    public void cleanup(){
        DriverManager.stop();
    }

    @Given("the page {string} is loaded")
    public void thePageIsLoaded(String url){
        final var driver = DriverManager.getDriver();
        driver.get(url);
    }

    @Then("the URL should be {string}")
    public void theURLShouldBe(String url){
        final var driver = DriverManager.getDriver();
        final var actualURL = driver.getCurrentUrl();

        assert actualURL != null;
        Assert.assertEquals(url, actualURL);
    }

    @When("(the user) selects {string} link")
    public void theLinkIsSelected(String link){
        final var driver = DriverManager.getDriver();
        driver.findElement(By.cssSelector("a[data-testid='"+ link +"']")).click();
    }

//    for title or name on film and actor lists
    @Then("the page should contain {string} with the text of {string}")
    public void theSpecificTextShouldBeDisplayed(String card, String title){
        final var driver = DriverManager.getDriver();
        final WebElement result = driver.findElement(By.cssSelector("h1[data-testid='"+ card +"']"));

        assertEquals(result.getText(), title);
    }

    @Then("should contain {string}")
    public void theMoreInfoShouldBeDisplayed(String card){
        final var driver = DriverManager.getDriver();
        final WebElement result = driver.findElement(By.cssSelector("a[data-testid='"+ card +"']"));

        assertTrue(result.isDisplayed());
    }

    @Then("the page should contain {string}")
    public void theListShouldBeDisplayed(String card){
        final var driver = DriverManager.getDriver();
        final WebElement result = driver.findElement(By.cssSelector("div[data-testid='"+ card +"']"));

        assertTrue(result.isDisplayed());
    }
}
