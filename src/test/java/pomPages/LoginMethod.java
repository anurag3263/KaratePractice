package pomPages;

import java.time.Duration;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class LoginMethod{
 //  public static ChromeOptions options=new ChromeOptions();
///	options.addArguments("--remote-allow-origins=*");
	static WebDriver driver= new ChromeDriver();;
	 
	public static void loginRetro(String username, String password) throws InterruptedException {
		LoginPage loginPage=new LoginPage();
//		ChromeOptions options=new ChromeOptions();
//		options.addArguments("--remote-allow-origins=*");
	//	driver= new ChromeDriver(options);
		driver.manage().window().maximize();
		driver.get("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
		driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(15));
		WebDriverWait wait = new WebDriverWait(driver,Duration.ofSeconds(20));
		wait.until(ExpectedConditions.visibilityOf(loginPage.usernameInputField));
		loginPage.usernameInputField.click();
		loginPage.usernameInputField.sendKeys(username);
		loginPage.passwordInputField.click();
		loginPage.passwordInputField.sendKeys(password);
		loginPage.submitButtonElement.click();
		Thread.sleep(4000);
	}

}
