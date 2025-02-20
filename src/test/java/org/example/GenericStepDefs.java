package org.example;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.Assert;

import java.time.Duration;

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
}
