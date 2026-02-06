@getRoomSummary @hotelBookingRegression @getBookingDetailsByRoomid
Feature: Getting a room summary

	@getRoomSummaryPositiveflow @getBookingDetailsByRoomidPositiveflow
	Scenario: Get the details of the room by room id
    	Given user hits endpoint "api/auth/login"
		When user enters "admin" and "password"
		Then the response status code should be 200
		Given user hits endpoint "api/booking"
		When user asks the details of the room by room id 1
		Then the response status code should be 200

	@getRoomSummaryError @getBookingDetailsByRoomidError
	Scenario Outline: Get the details of the room by incorrect/invalid room id
		Given user hits endpoint "api/auth/login"
		When user enters "admin" and "password"
		Then the response status code should be 200
		Given user hits endpoint "api/booking"
		When user asks the details of the room by "<roomid>"
		Then the response status code should be "<code>"
        Examples:
        	| roomid | code|
      		|        | 400 |
      		|    a   | 500 | 
      
	@getRoomSummaryError @getBookingDetailsByRoomidError
	Scenario Outline: Error scenario to check authorization passing empty token
		Given user hits endpoint "api/booking"
		When user asks the details of the room by "<roomid>"
		Then the response status code should be "<code>"
		Examples:
      		| roomid | code|
      		|   1    | 500 |
      
	@getRoomSummaryError @getBookingDetailsByRoomidError
	Scenario Outline: Error scenario to check authorization passing empty token
		Given user hits endpoint "api/booking"
		When user asks the details of the room without token by "<roomid>"
		Then the response status code should be "<code>"
		Examples:
      		| roomid | code |
      		|   1    | 401  |
