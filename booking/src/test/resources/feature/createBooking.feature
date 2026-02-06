@createBooking @hotelBookingRegression
Feature: booking a room

	@createBookingPositiveflow
	Scenario Outline: Create a room booking
    	Given user hits endpoint "api/booking"
    	When user books the room with details "<firstname>","<lastname>","<email>","<phone>","<checkin>","<checkout>"
    	Then the response status code should be 201
		Examples:
      		| firstname | lastname | email                 | phone       | checkin    | checkout   |
      		| depa      | july     | user.nsbd@gmail.com   | 46645895464 | 2026-04-23 | 2026-04-25 |

      
	@createBookingErorrs
	Scenario Outline: create a booking with incorrect field values
		Given user hits endpoint "api/booking"
    	When user books the room with details "<firstname>","<lastname>","<email>","<phone>","<checkin>","<checkout>"
    	Then the response status code should be 400
		And the user should get response with "<Errormsg>"
		Examples:
      		| firstname | lastname | email               | phone       | checkin    | checkout   | Errormsg                                                   |
      		|           | tyru     | user.nsbd@gmail.com | 46645895464 | 2026-02-15 | 2026-02-17 | Firstname should not be blank,size must be between 3 and 18|
      		| twoc      | e        | edrft@gmail.com     | 46645895464 | 2026-02-15 | 2026-02-17 | size must be between 3 and 30                              |
      		| ncft      | bftg     | bcgt                | 46645895464 | 2026-02-15 | 2026-02-17 | must be a well-formed email address                        |
      		| cxst      | last     | premagth@gmail.com  | 8795587970  | 2026-02-15 | 2026-02-17 | size must be between 11 and 21                             |
      		| atru      | last     | vfr.ploiu@gmail.com | 46645895464 |            | 2026-02-17 | must not be null                                           |
      		| atru      | last     | vfr.ploiu@gmail.com | 46645895464 |   2026-    | 2026-02-17 | Failed to create booking                                   |
      		| atru      | last     | vfr.ploiu@gmail.com | 46645895464 |2026-02-17  | 02-17      | Failed to create booking                                   |
      
	@createBookingErorrs
	Scenario Outline: booking a room which is already booked
   		Given user hits endpoint "api/booking"
   		When user books the room with details "<firstname>","<lastname>","<email>","<phone>","<checkin>","<checkout>","<roomid>"
    	Then the response status code should be 201
    	Given user hits endpoint "api/booking"
  		When user books the room with details "<firstname>","<lastname>","<email>","<phone>","<checkin>","<checkout>","<roomid>"
    	Then the response status code should be 409
    	# below code is added to maintain the same data regularly
    	Given user hits endpoint "api/auth/login"
		When user enters "admin" and "password"
		Then the response status code should be 200 
    	Given user hits endpoint "api/booking/"
		When the user deletes the booking with booking ID
		Then the response status code should be 200
		Examples:
      		| firstname | lastname  | email               | phone       | checkin    | checkout   |roomid|
      		| kSDFb     | SDFSDf    | dsfkjhkjSD@gmail.com| 07358480685 | 2026-02-26 | 2026-02-27 |11    |
      
      