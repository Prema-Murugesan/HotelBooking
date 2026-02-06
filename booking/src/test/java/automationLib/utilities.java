package automationLib;

import static org.junit.Assert.assertEquals;

import java.io.FileInputStream;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import org.json.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import automationLib.requestValues;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class utilities {
	
	protected  requestValues requestValues = new requestValues();
	String apiurl="https://automationintesting.online/";
	private static FileInputStream input;
	private static Properties prop = null;
	protected Response response;
	RequestSpecification requestSpecification;
	JSONObject requestBody;
	
	public String generateRandomRoomId() {

		final Random random = new Random();
		return String.valueOf(2000 + random.nextInt(900));

	}
	
	public RequestSpecification requestSetup() {	 
		RestAssured.baseURI = apiurl;
		return RestAssured.given().relaxedHTTPSValidation().contentType(io.restassured.http.ContentType.JSON);
	}	

}
