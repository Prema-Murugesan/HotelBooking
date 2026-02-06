@getCheckAvailablity @hotelBookingRegression
Feature: Checking Availablity
 

	@getCheckAvailablityPositiveflow
	Scenario Outline: Get the availability of the room from dates
		Given user hits endpoint "api/room"
		When user requests the room availability details from "<checkin>" to "<checkout>" dates
		Then the response status code should be 200
	
	 	Examples:
      		| checkin    | checkout   |
      		| 2026-02-15 | 2026-02-17 |
      		|            | 2025-02-21 |
       		| 2026-02-15 |            |
       		|            |            |
	
	@getCheckAvailablityPositiveflow
	Scenario: Get the availability of the room without giving dates
		Given user hits endpoint "api/room"
		When user requests the room availability details without giving dates
		Then the response status code should be 200

	@getCheckAvailablityError
	Scenario Outline: Get the availability  of the room by invalid dates/invalid format
		Given user hits endpoint "api/room"
		When user requests the room availability details from "<checkin>" to "<checkout>" dates
		Then the response status code should be 500
	
	 	Examples:
      		| checkin    | checkout   |
      		| 2026-      | 2026-02-17 |
      		| 2026-02-20 | -02-21     | 
      		| 2026-50-20 | 2026-02-17 | 
      		| 2026-02-15 | 2026-02-45 |
      
