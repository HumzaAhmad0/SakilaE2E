package org.example.home;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.example.DriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.Assert;

import java.time.Duration;

import static org.testng.Assert.assertEquals;

public class HomeStepDefs {


    @When("(the user) selects the {string} card")
    public void theCardIsSelected(String card){
        final var driver = DriverManager.getDriver();

        if (card.equals("spotlight-topfilm")){
            driver.findElement(By.cssSelector("h3[data-testid='"+ card +"']")).click();
        }else{
            driver.findElement(By.cssSelector("h4[data-testid='"+ card +"']")).click();
        }
    }

    @When("(the user) selects {string} from the navbar")
    public void theNavBarFilmsIsSelected(String link){
        final var driver = DriverManager.getDriver();

        driver.findElement(By.cssSelector("li[data-testid='"+ link +"']")).click();
    }


    @Then("the {string} should have the title of {string}")
    public void theTitleShouldBe(String card, String title){
        final var driver = DriverManager.getDriver();
        WebElement test;

        if (card.equals("spotlight-topfilm")){
            test = driver.findElement(By.cssSelector("h3[data-testid='"+ card +"']"));
        }else{
            test = driver.findElement(By.cssSelector("h4[data-testid='"+ card +"']"));
        }
        assertEquals(test.getText(), title, "Film title wrong");
    }

}
