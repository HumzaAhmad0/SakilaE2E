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

public class HomeStepDefs {
    WebDriver driver;

    @Before
    public void setup(){
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        final var options= new ChromeOptions();
        options.addArguments("--remote-allow-origins=*");
        driver = new ChromeDriver(options);
        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(2));
    }

    @After
    public void cleanup(){
        driver.close();
        driver.quit();
    }

    @Given("the page {string} is loaded")
    public void thePageIsLoaded(String url){
        driver.get(url);
    }

    @When("(the user) selects the {string} card")
    public void theCardIsSelected(String card){
        if (card.equals("spotlight-topfilm")){
            driver.findElement(By.cssSelector("h3[data-testid='"+ card +"']")).click();
        }else{
            driver.findElement(By.cssSelector("h4[data-testid='"+ card +"']")).click();
        }
    }

    @When("(the user) selects {string} from the navbar")
    public void theNavBarFilmsIsSelected(String link){
        driver.findElement(By.cssSelector("li[data-testid='"+ link +"']")).click();
    }

    @Then("the URL should be {string}")
    public void theURLShouldBe(String url){
        final var actualURL = driver.getCurrentUrl();

        assert actualURL != null;
        Assert.assertEquals(url, actualURL);
    }

    @Then("the {string} should have the title of {string}")
    public void theTitleShouldBe(String card, String title){
        WebElement test;
        if (card.equals("spotlight-topfilm")){
            test = driver.findElement(By.cssSelector("h3[data-testid='"+ card +"']"));
        }else{
            test = driver.findElement(By.cssSelector("h4[data-testid='"+ card +"']"));
        }
        assertEquals(test.getText(), title, "Film title wrong");
    }

}
