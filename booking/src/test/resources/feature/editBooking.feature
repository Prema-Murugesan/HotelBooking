@editBooking @hotelbookingregression
Feature: Edit the booking

	@editBookingPositiveflow
	Scenario Outline:  Edit booking
    	Given user hits endpoint "api/booking"
    	When user books the room with details "<firstname>","<lastname>","<email>","<phone>","<checkin>","<checkout>"
    	Then the response status code should be 201
    	Given user hits endpoint "api/auth/login"
		When user enters "admin" and "password"
		Then the response status code should be 200 
    	Given user hits endpoint "api/booking/"
    	When the user edits the booking details "mare","tuly","2026-02-27","2026-02-28","21"
    	Then the response status code should be 200
    	Examples:
        	| firstname | lastname | email                 | phone       | checkin    | checkout   |
            | fure      | tolu     | dare.july@gmail.com   | 74185895464 | 2026-02-10 | 2026-02-11 |

    @editBookingError
    Scenario Outline:  Edit booking error scenario
    	Given user hits endpoint "api/auth/login"
		When user enters "admin" and "password"
		Then the response status code should be 200 
		Given user hits endpoint "api/booking"
		When user asks the details of the room by room id 1
		Then the response status code should be 200
    	Given user hits endpoint "api/booking/"
    	When the user edits the booking details "<firstname>","<lastname>","<checkin>","<checkout>","<roomid>"
    	Then the response status code should be 400
    	And the user should get response with "<Errormsg>"
     	Examples:  
        	| firstname | lastname |  checkin    | checkout   | roomid | Errormsg                          |
            |           | tyru     |  2026-02-15 | 2026-02-17 | 51     |Firstname should not be blank      |
            | twoc.     | e        |  2026-02-15 | 2026-02-17 | 52     |size must be between 3 and 30      |
            | atru      | last     |             | 2026-02-17 | 53     |must not be null                   |
            | atru      | last     |    2026-    | 2026-02-17 | 54     |Failed to update booking           |
            | atru      | last     | 2026-02-17  | 02-17      | 55     |Failed to update booking           |

	@editBookingError
	Scenario Outline:  Edit booking details not found
    	Given user hits endpoint "api/auth/login"
		When user enters "admin" and "password"
		Then the response status code should be 200
		Given user hits endpoint "api/booking/"
    	When the user edits the booking details "<firstname>","<lastname>","<checkin>","<checkout>","<roomid>","<bookingid>"
    	Then the response status code should be 404
     	Examples:  
     		| firstname | lastname |  checkin    | checkout   | roomid | bookingid|
        	| sDf       | kjh      |  2026-03-16 | 2026-03-17 | 2      |    4     |
    
	@editBookingError
	Scenario Outline:  Error scenario to check authorization passing empty token
		Given user hits endpoint "api/booking/"
    	When the user edits the booking details "<firstname>","<lastname>","<checkin>","<checkout>","<roomid>","<bookingid>"
    	Then the response status code should be 403
     	Examples:  
     		| firstname | lastname |  checkin    | checkout   | roomid | bookingid|
     		| sDf       | kjh      |  2026-03-16 | 2026-03-17 | 2      |    4     |
    
	@editBookingError
	Scenario Outline:  Error scenario to check authorization without token
		Given user hits endpoint "api/booking/"
    	When the user edits the booking details without token "<firstname>","<lastname>","<checkin>","<checkout>","<roomid>","<bookingid>"
    	Then the response status code should be 401
     	Examples:  
     		| firstname | lastname |  checkin    | checkout   | roomid | bookingid|
     		| sDf       | kjh      |  2026-03-16 | 2026-03-17 | 2      |    4     |
      
      
      
      
      
