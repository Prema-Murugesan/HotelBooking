@DeleteBooking @hotelbookingregression
Feature: Delete booking

@DeleteBookingPositiveflow
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
      | firstname | lastname | email              | phone       | checkin    | checkout   |roomid|
      | boli     | moli  | dare.july@gmail.com   | 74185895464 | 2026-02-12 | 2026-02-13 |88|
