import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import java.time.Duration;

import static org.testng.Assert.assertEquals;

public class HomePageTests {
    ChromeDriver driver;

    @BeforeClass
    public void beforeAll(){
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");

        final var options= new ChromeOptions();
        options.addArguments("--remote-allow-origins=*");

        driver = new ChromeDriver(options);
        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(2));


    }

    @BeforeMethod
    public void beforeEach(){
        driver.get("http://localhost:5174/");
    }

    @Test
    public void testTopFilmsInCorrectOrder(){
        final var spotlight = driver.findElement(By.cssSelector("h3[data-testid='spotlight-topfilm']"));
        final var second = driver.findElement(By.cssSelector("h4[data-testid='sublight-1']"));
        final var third = driver.findElement(By.cssSelector("h4[data-testid='sublight-2']"));
        final var fourth = driver.findElement(By.cssSelector("h4[data-testid='sublight-3']"));
        final var fifth = driver.findElement(By.cssSelector("h4[data-testid='sublight-4']"));
        {
            assertEquals(spotlight.getText(), "NUM", "top film wrong");
            assertEquals(second.getText(), "SLUMS DUCK");
            assertEquals(third.getText(), "RIGHT CRANES");
            assertEquals(fourth.getText(), "HALLOWEEN NUTS");
            assertEquals(fifth.getText(), "MIDNIGHT WESTWARD");
        }
    }

    @Test
    public void testNavigateToListOfFilms(){

    }

    @AfterClass
    public void afterAll(){
        driver.quit();
    }
}
