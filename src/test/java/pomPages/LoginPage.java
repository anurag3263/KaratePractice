package pomPages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;


public class LoginPage extends LoginMethod{
		
	public LoginPage(){
		 PageFactory.initElements(driver,this);
	 }
	
	@FindBy(xpath = "//*[@name='username']")
	public  WebElement usernameInputField;
	
	@FindBy(xpath = "//*[@name='password']")
	public  WebElement passwordInputField;
	
	@FindBy(xpath = "//*[@type='submit']")
	public  WebElement submitButtonElement;
	
	@FindBy(xpath = "//*[contains(@class,'alert-content-text')]")
	public WebElement errorText;


}
