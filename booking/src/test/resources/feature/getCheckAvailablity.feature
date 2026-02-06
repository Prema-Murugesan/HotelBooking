@GetCheckAvailablity @hotelbookingregression
Feature: Checking Availablity
 

@getCheckAvailablityPositiveflow
Scenario Outline: Get the details of the room by room id
	Given user hits endpoint "api/room"
	When user requests the room availability details from "<checkin>" to "<checkout>" dates
	Then the response status code should be 200
	
	 Examples:
      | checkin    | checkout   |
      | 2026-02-15 | 2026-02-17 |
      |  | 2025-02-21 |
       | 2026-02-15 | |
	
@getCheckAvailablityerror
Scenario Outline: Get the details of the room by incorrect/invalid room id
	Given user hits endpoint "api/room"
	When user requests the room availability details from "<checkin>" to "<checkout>" dates
	Then the response status code should be 500
	
	 Examples:
      | checkin    | checkout   |
      | 2026- | 2026-02-17 |
      | 2026-02-20 | -02-21 | 