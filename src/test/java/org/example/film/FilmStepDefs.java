package org.example.film;

import io.cucumber.java.en.Then;
import org.example.DriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import static org.testng.Assert.assertEquals;

public class FilmStepDefs {




    @Then("should contain {string} with the year of {string}")
    public void theFilmYearShouldBe(String card, String year){
        final var driver = DriverManager.getDriver();
        final WebElement result = driver.findElement(By.cssSelector("h2[data-testid='"+ card +"']"));

        assertEquals(result.getText(), year);
    }

    @Then("should contain {string} with the description of {string}")
    public void theFilmDescriptionShouldBe(String card, String desc){
        final var driver = DriverManager.getDriver();
        final WebElement result = driver.findElement(By.cssSelector("p[data-testid='"+ card +"']"));

        assertEquals(result.getText(), desc);
    }

    @Then("should contain {string} with the score of {string}")
    public void theFilmScoreShouldBe(String card, String score){
        final var driver = DriverManager.getDriver();
        final WebElement result = driver.findElement(By.cssSelector("h2[data-testid='"+ card +"']"));

        assertEquals(result.getText(), score);
    }

}
