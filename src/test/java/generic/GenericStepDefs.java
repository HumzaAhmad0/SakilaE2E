package generic;

import driver.DriverManager;
import io.cucumber.java.After;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.*;
import org.testng.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;



import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

public class GenericStepDefs {

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
//
//    @When("(the user) selects {string} link")
//    public void theLinkIsSelected(String link){
//        final var driver = driver.DriverManager.getDriver();
//        driver.findElement(By.cssSelector("a[data-testid='"+ link +"']")).click();
//    }

//    @When("(the user) selects {string} link")
//    public void theLinkIsSelected(String link) {
//        final var driver = driver.DriverManager.getDriver();
//        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
//        WebElement linkElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("[data-testid='" + link + "']")));
//        linkElement.click();
//    }

    @When("(the user) selects {string} link")
    public void theLinkIsSelected(String link) {
        final var driver = DriverManager.getDriver();

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));

        WebElement linkElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("a[data-testid='" + link + "']")));

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



    @Then("the page should contain {string} with the text of {string}")
    public void theSpecificTextShouldBeDisplayed(String card, String title){
        final var driver = DriverManager.getDriver();
        final WebElement result = driver.findElement(By.cssSelector("[data-testid='"+ card +"']"));

        assertEquals(result.getText(), title);
    }

    @Then("the page should contain input {string} with the text of {string}")
    public void theSpecificTextShouldBeDisplayedInput(String card, String title){
        final var driver = DriverManager.getDriver();
        final WebElement result = driver.findElement(By.cssSelector("[data-testid='"+ card +"']"));

        assertEquals(result.getDomProperty("value"), title);
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
