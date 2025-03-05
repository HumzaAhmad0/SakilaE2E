package home;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import driver.DriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import static org.testng.Assert.assertEquals;

public class HomeStepDefs {


    @When("(the user) selects the {string} card")
    public void theCardIsSelected(String card){
        final var driver = DriverManager.getDriver();

        driver.findElement(By.cssSelector("div[data-testid='"+ card +"']")).click();
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
            test = driver.findElement(By.cssSelector("h3[data-testid='spotlight-title-topfilm']"));
        } else {
            test = driver.findElement(By.cssSelector("h4[data-testid='sublight-title-" + card.split("-")[1] + "']"));
        }
        assertEquals(test.getText(), title, "Film title is wrong");
    }

    @Then("the {string} should have the year {string}")
    public void theYearShouldBe(String card, String year){
        final var driver = DriverManager.getDriver();
        WebElement test;

        if (card.equals("spotlight-topfilm")){
            test = driver.findElement(By.cssSelector("p[data-testid='spotlight-year-topfilm']"));
        } else {
            test = driver.findElement(By.cssSelector("p[data-testid='sublight-year-" + card.split("-")[1] + "']"));
        }
        assertEquals(test.getText(), year, "Film year is wrong");
    }

    @Then("the {string} should have the score {string}")
    public void theScoreShouldBe(String card, String score){
        final var driver = DriverManager.getDriver();
        WebElement test;

        if (card.equals("spotlight-topfilm")){
            test = driver.findElement(By.cssSelector("div[data-testid='spotlight-score-topfilm']"));
        } else {
            test = driver.findElement(By.cssSelector("p[data-testid='sublight-score-" + card.split("-")[1] + "']"));
        }
        assertEquals(test.getText(), score, "Film score is wrong");
    }

    @Then("the {string} should have the description {string}")
    public void theSpotLightDescShouldBe(String card, String desc){
        final var driver = DriverManager.getDriver();
        WebElement result;
        result = driver.findElement(By.cssSelector("p[data-testid='"+ card +"']"));

        assertEquals(result.getText(), desc, "Film description is wrong");
    }


}
