package org.example.film;

import io.cucumber.java.en.When;
import org.example.DriverManager;
import org.example.GenericStepDefs;
import org.openqa.selenium.By;

public class FilmStepDefs {

    @When("(the user) selects {string} link")
    public void theCardIsSelected(String link){
        final var driver = DriverManager.getDriver();
        driver.findElement(By.cssSelector("a[data-testid='"+ link +"']")).click();
    }

}
