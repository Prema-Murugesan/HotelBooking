@deleteBooking @hotelBookingRegression
Feature: Delete booking

	@deleteBookingPositiveflow
	Scenario Outline:  delete booking
    	Given user hits endpoint "api/booking"
    	When user books the room with details "<firstname>","<lastname>","<email>","<phone>","<checkin>","<checkout>","<roomid>"
    	Then the response status code should be 201
    	Given user hits endpoint "api/auth/login"
		When user enters "admin" and "password"
		Then the response status code should be 200 
    	Given user hits endpoint "api/booking/"
		When the user deletes the booking with booking ID
		Then the response status code should be 200
    	Examples:
      		| firstname | lastname | email                 | phone       | checkin    | checkout   | roomid |
      		| boli      | moli     | dare.july@gmail.com   | 74185895464 | 2026-02-12 | 2026-02-13 |    88  |

	@deleteBookingError
	Scenario Outline:  delete booking error scenario
    	Given user hits endpoint "api/auth/login"
		When user enters "admin" and "password"
		Then the response status code should be 200 
    	Given user hits endpoint "api/booking/"
		When the user deletes the booking with booking ID "<bookingid>"
		Then the response status code should be "<code>"   
	 	Examples:
        	|bookingid| code|
        	| 88      | 500 |
        	| @       | 500 |
       		| a       | 500 |
        	|         | 308 |
			
	@deleteBookingError
	Scenario:  Error scenario to check authorization
    	Given user hits endpoint "api/booking/"
		When the user deletes the booking without token using booking ID "1" 
		Then the response status code should be 401   
<<<<<<< HEAD
	 
=======
	 
>>>>>>> 57d923391696e1dfcc5aa99514298bceaf2b372b
