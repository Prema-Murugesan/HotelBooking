package stepdefinitions;

import static org.junit.Assert.assertEquals;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;
import org.testng.AssertJUnit;

import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.HashMap;
import java.util.Map;

import automationLib.requestValues;
import automationLib.utilities;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
//import io.restassured.module.jsv.JsonSchemaValidator;
import io.restassured.response.Response;
import io.restassured.response.ResponseBodyExtractionOptions;
import io.restassured.response.ResponseOptions;

public class stepdefinitions extends Utilities{
	    private Response response;
	    private String username;
	    private String password;
	    
	    @Given("user hits endpoint {string}")
	    public void user_hits_endpoint(String url) {
	    	requestValues.setEndPoint(url);
	    }

	    @When("user enters {string} and {string}")
	    public void user_enters_and(String username, String password) {
	    	this.username = username;
	        this.password = password;
	       
	        String body = "{\n"
	                + "  \"username\": \"" + username + "\",\n"
	                + "  \"password\": \"" + password + "\"\n"
	                + "}";
	        response = requestSetup().body(body).post(requestValues.getEndPoint());
	        String token = response.jsonPath().getString("token");
	        requestValues.setToken(token);
	    }

	    @Then("the response status code should be {int}")
	    public void the_response_status_code_should_be(Integer code) {
//	    	System.out.println(response.getStatusCode());
	    	response.then().statusCode(code);	
	    }
	    
	    @When("user books the room with details {string},{string},{string},{string},{string},{string}")
	    public void user_books_the_room_with_details(String firstname, String lastname, String email, String phone, String checkin, String checkout) {
	    	
	    	int roomid = Integer.parseInt(generateRandomRoomId());
	    	System.out.println(roomid);
	    	requestValues.setFirstname(firstname);
	    	requestValues.setLastname(lastname);
	    	requestValues.setEmail(email);
	    	requestValues.setPhone(phone);
	    	requestValues.setCheckin(checkin);
	    	requestValues.setCheckout(checkout);
	    	requestValues.setRoomid(roomid);
	    	requestValues.setDepositpaid(false);
						
	    String body1 = "{\r\n"
	    		+ "    \"roomid\": \""+roomid+"\",\r\n"
	    		+ "    \"firstname\": \""+firstname+"\",\r\n"
	    		+ "    \"lastname\": \""+lastname+"\",\r\n"
	    		+ "    \"depositpaid\": false,\r\n"
	    		+ "    \"bookingdates\": {\r\n"
	    		+ "        \"checkin\": \""+checkin+"\",\r\n"
	    		+ "        \"checkout\": \""+checkout+"\"\r\n"
	    		+ "    },\r\n"
	    		+ "    \"email\": \""+email+"\",\r\n"
	    		+ "    \"phone\": \""+phone+"\"\r\n"
	    		+ "}";
	    
	    response = requestSetup().body(body1).post(requestValues.getEndPoint());
	    if(response.getStatusCode()==201)
	    {
	    	System.out.println("created successfully");
	       int  bookingId = response.jsonPath().getInt("bookingid");
	       requestValues.setBookingId(bookingId);
	       
	        String responseRoomId = response.jsonPath().getString("roomid");      
			String responseFirstname = response.jsonPath().getString("firstname");
			String responseLastname = response.jsonPath().getString("lastname");
			String responseCheckin = response.jsonPath().getString("bookingdates.checkin");
			String responseCheckout = response.jsonPath().getString("bookingdates.checkout");
			if(responseFirstname.equals(firstname))
			{
				System.out.println("First Name matched");
			}
			if(responseRoomId.equals(String.valueOf(roomid)))
			{
				System.out.println("roomid matched");
			}
			if(responseLastname.equals(lastname))
			{
				System.out.println("last name matched");
			}
			if(responseCheckin.equals(checkin))
			{
				System.out.println("checkin  matched");
			}
			if(responseCheckout.equals(checkout))
			{
				System.out.println("checkout matched");
			}
			
	    }
	   
	    }
	    
	    @When("user books the room with details {string},{string},{string},{string},{string},{string},{string}")
	    public void user_books_the_room_with_details(String firstname, String lastname, String email, String phone, String checkin, String checkout, String roomid) {
	    	int room = Integer.parseInt(roomid);
	    	requestValues.setFirstname(firstname);
	    	requestValues.setLastname(lastname);
	    	requestValues.setEmail(email);
	    	requestValues.setPhone(phone);
	    	requestValues.setCheckin(checkin);
	    	requestValues.setCheckout(checkout);
	    	requestValues.setRoomid(room);
	    	requestValues.setDepositpaid(false);
						
	    String body2 = "{\r\n"
	    		+ "    \"roomid\": \""+roomid+"\",\r\n"
	    		+ "    \"firstname\": \""+firstname+"\",\r\n"
	    		+ "    \"lastname\": \""+lastname+"\",\r\n"
	    		+ "    \"depositpaid\": false,\r\n"
	    		+ "    \"bookingdates\": {\r\n"
	    		+ "        \"checkin\": \""+checkin+"\",\r\n"
	    		+ "        \"checkout\": \""+checkout+"\"\r\n"
	    		+ "    },\r\n"
	    		+ "    \"email\": \""+email+"\",\r\n"
	    		+ "    \"phone\": \""+phone+"\"\r\n"
	    		+ "}";
	    
	    response = requestSetup().body(body2).post(requestValues.getEndPoint());
	    if(response.getStatusCode()==201)
	    {
	    	System.out.println("created successfully");
	       int  bookingId = response.jsonPath().getInt("bookingid");
	       requestValues.setBookingId(bookingId);
	       
	        String responseRoomId = response.jsonPath().getString("roomid");      
			String responseFirstname = response.jsonPath().getString("firstname");
			String responseLastname = response.jsonPath().getString("lastname");
			String responseCheckin = response.jsonPath().getString("bookingdates.checkin");
			String responseCheckout = response.jsonPath().getString("bookingdates.checkout");
			if(responseFirstname.equals(firstname))
			{
				System.out.println("First Name matched");
			}
			if(responseRoomId.equals(String.valueOf(roomid)))
			{
				System.out.println("roomid matched");
			}
			if(responseLastname.equals(lastname))
			{
				System.out.println("last name matched");
			}
			if(responseCheckin.equals(checkin))
			{
				System.out.println("checkin  matched");
			}
			if(responseCheckout.equals(checkout))
			{
				System.out.println("checkout matched");
			}
			
	    }
	    }

	    @Then("the user should get response with {string}")
	    public void the_user_should_get_response_with(String errorMessage) {
	    	List<String> actualErrorMessage = response.jsonPath().getList("errors");
			assertEquals("Error message mismatch", errorMessage, actualErrorMessage.get(0));  
	}
	    
	    
	    @When("user asks the details of the room by room id {int}")
	    public void user_asks_the_details_of_the_room_by_room_id(Integer roomid) {
	    	String value="token="+requestValues.getToken();
	    	response = requestSetup().header("Cookie", value)
					.param("roomid", roomid)
					.get(requestValues.getEndPoint());
	    	int bookingId = response.jsonPath().getInt("bookings[0].bookingid");
	    	requestValues.setBookingId(bookingId);
			System.out.println("Booking ID of the booked room = " + bookingId);	
	    }
	    
	    @When("user asks the details of the room by {string}")
	    public void user_asks_the_details_of_the_room_by(String roomid) {
	    	String value="token="+requestValues.getToken();
	    	
	    	response = requestSetup().header("Cookie", value)
					.param("roomid", roomid)
					.get(requestValues.getEndPoint());
	    }
	    
	    @When("user asks the details of the room without token by {string}")
	    public void user_asks_the_details_of_the_room_without_token_by(String roomid) {

	    response = requestSetup().param("roomid", roomid).get(requestValues.getEndPoint());
	        
	    }


	    @Then("the response status code should be {string}")
	    public void the_response_status_code_should_be(String code) {
	    	int statuscode=Integer.parseInt(code);
	    	response.then().statusCode(statuscode);
	    }
	    
	    @Given("user hits endpoint {string},{string}")
	    public void user_hits_endpoint(String url1, String url2) {
	    	String url=url1+url2;
	    	requestValues.setEndPoint(url);
	    }

	    @When("user asks about the room")
	    public void user_asks_about_the_room_by_roomid() {
	    	response = requestSetup().get(requestValues.getEndPoint());
	    }
	    
	    @When("user requests the room availability details from {string} to {string} dates")
	    public void user_requests_the_room_availability_details_from_to_dates(String checkin, String checkout) {
	    	response = requestSetup()
					.param("checkin", checkin)
					.param("checkout", checkout)
					.get(requestValues.getEndPoint());
	    }
	    
	    @When("user requests the room availability details without giving dates")
	    public void user_requests_the_room_availability_details_without_giving_dates() {
	        // Write code here that turns the phrase above into concrete actions
	    	response = requestSetup().get(requestValues.getEndPoint());
	    }
	    
	    @When("user asks for the booking report")
	    public void user_asks_for_the_booking_report() {
        String value="token="+requestValues.getToken();
	    response = requestSetup().header("Cookie", value).get(requestValues.getEndPoint());
	    }
	    
	    @When("user asks for the booking report without token")
	    public void user_asks_for_the_booking_report_without_token() {
	    	response = requestSetup().get(requestValues.getEndPoint());   

}
	   

		@When("the user edits the booking details {string},{string},{string},{string},{string}")
		public void the_user_edits_the_booking_details(String firstname, String lastname, String checkin, String checkout, String roomid) {
			System.out.println(roomid);
			int room = Integer.parseInt(roomid);
	    	requestValues.setFirstname(firstname);
	    	requestValues.setLastname(lastname);
	    	requestValues.setCheckin(checkin);
	    	requestValues.setCheckout(checkout);
	    	requestValues.setRoomid(room);
	    	requestValues.setDepositpaid(false);
	    	int Bookingid = requestValues.getBookingId();
	    	String bookingid = String.valueOf(Bookingid);
						
	    String body3 = "{\r\n"
	    		+ "    \"bookingid\": \""+bookingid+"\",\r\n"
	    		+ "    \"roomid\": \""+roomid+"\",\r\n"
	    		+ "    \"firstname\": \""+firstname+"\",\r\n"
	    		+ "    \"lastname\": \""+lastname+"\",\r\n"
	    		+ "    \"depositpaid\": false,\r\n"
	    		+ "    \"bookingdates\": {\r\n"
	    		+ "        \"checkin\": \""+checkin+"\",\r\n"
	    		+ "        \"checkout\": \""+checkout+"\"\r\n"
	    		+ "    }\r\n"
	    		+ "}";
	    String Actualep=requestValues.getEndPoint()+bookingid;
	    String value="token="+requestValues.getToken();
	    response = requestSetup().header("Cookie", value).body(body3).put(Actualep);
		}
		
		
		@When("the user edits the booking details {string},{string},{string},{string},{string},{string}")
		public void the_user_edits_the_booking_details( String firstname, String lastname, String checkin, String checkout, String roomid,String Bookingid) {
			int room = Integer.parseInt(roomid);
	    	requestValues.setFirstname(firstname);
	    	requestValues.setLastname(lastname);
	    	requestValues.setCheckin(checkin);
	    	requestValues.setCheckout(checkout);
	    	requestValues.setRoomid(room);
	    	requestValues.setDepositpaid(false);
	    	int Booking = Integer.parseInt(Bookingid);
	    	requestValues.setBookingId(Booking);
	    	 String body4 = "{\r\n"
	 	    		+ "    \"bookingid\": \""+Booking+"\",\r\n"
	 	    		+ "    \"roomid\": \""+roomid+"\",\r\n"
	 	    		+ "    \"firstname\": \""+firstname+"\",\r\n"
	 	    		+ "    \"lastname\": \""+lastname+"\",\r\n"
	 	    		+ "    \"depositpaid\": false,\r\n"
	 	    		+ "    \"bookingdates\": {\r\n"
	 	    		+ "        \"checkin\": \""+checkin+"\",\r\n"
	 	    		+ "        \"checkout\": \""+checkout+"\"\r\n"
	 	    		+ "    }\r\n"
	 	    		+ "}";
	 	    String Actualep=requestValues.getEndPoint()+Bookingid;
	 	    String value="token="+requestValues.getToken();
	 	    response = requestSetup().header("Cookie", value).body(body4).put(Actualep);
		}
		
		@When("the user edits the booking details without token {string},{string},{string},{string},{string},{string}")
		public void the_user_edits_the_booking_details_without_token(String firstname, String lastname, String checkin, String checkout, String roomid,String Bookingid) {
			int room = Integer.parseInt(roomid);
	    	requestValues.setFirstname(firstname);
	    	requestValues.setLastname(lastname);
	    	requestValues.setCheckin(checkin);
	    	requestValues.setCheckout(checkout);
	    	requestValues.setRoomid(room);
	    	requestValues.setDepositpaid(false);
	    	int Booking = Integer.parseInt(Bookingid);
	    	requestValues.setBookingId(Booking);
	    	 String body4 = "{\r\n"
	 	    		+ "    \"bookingid\": \""+Booking+"\",\r\n"
	 	    		+ "    \"roomid\": \""+roomid+"\",\r\n"
	 	    		+ "    \"firstname\": \""+firstname+"\",\r\n"
	 	    		+ "    \"lastname\": \""+lastname+"\",\r\n"
	 	    		+ "    \"depositpaid\": false,\r\n"
	 	    		+ "    \"bookingdates\": {\r\n"
	 	    		+ "        \"checkin\": \""+checkin+"\",\r\n"
	 	    		+ "        \"checkout\": \""+checkout+"\"\r\n"
	 	    		+ "    }\r\n"
	 	    		+ "}";
	 	    String Actualep=requestValues.getEndPoint()+Bookingid;
	 	    response = requestSetup().body(body4).put(Actualep);
		}
		
		@When("the user deletes the booking with booking ID")
		public void theUserDeletesTheBookingWithBookingID() {
			int Bookingid = requestValues.getBookingId();
	    	String bookingid = String.valueOf(Bookingid);
			 String Actualep=requestValues.getEndPoint()+bookingid;
			    String value="token="+requestValues.getToken();
			    response = requestSetup().header("Cookie", value).delete(Actualep);
		}
		
		@When("the user deletes the booking with booking ID {string}")
		public void the_user_deletes_the_booking_with_booking_id(String Bookingid) {
			String Actualep=requestValues.getEndPoint()+Bookingid;
		    String value="token="+requestValues.getToken();
		    response = requestSetup().header("Cookie", value).delete(Actualep);
		}
		
		@When("the user deletes the booking without token using booking ID {string}")
		public void the_user_deletes_the_booking_without_token_using_booking_id(String Bookingid) {
			String Actualep=requestValues.getEndPoint()+Bookingid;
		    response = requestSetup().delete(Actualep);
		}

		
}
