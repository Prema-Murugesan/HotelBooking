@CreateBooking @hotelbookingregression
Feature: booking a room

@CreateBookingPositiveflow
Scenario Outline: Create a room booking
    Given user hits endpoint "api/booking"
    When user books the room with details "<firstname>","<lastname>","<email>","<phone>","<checkin>","<checkout>"
    Then the response status code should be 201

    Examples:
      | firstname | lastname | email              | phone       | checkin    | checkout   |
      | depu     | jules  | user.nsbd@gmail.com   | 46645895464 | 2026-02-23 | 2026-02-25 |
      | mutr      | kite      | user.msd@gmail.com | 77775895464 | 2026-02-12 | 2025-02-13 |

      
@CreateBookingerorrs
Scenario Outline: create a booking with incorrect field values
	Given user hits endpoint "api/booking"
    When user books the room with details "<firstname>","<lastname>","<email>","<phone>","<checkin>","<checkout>"
    Then the response status code should be 400
	And the user should get response with "<Errormsg>"

    Examples:
      | firstname | lastname | email               | phone       | checkin    | checkout   | Errormsg                            |
      || tyru                | user.nsbd@gmail.com | 46645895464 | 2026-02-15 | 2026-02-17 | Firstname should not be blank       |
      | twoc.     | e        | edrft@gmail.com     | 46645895464 | 2026-02-15 | 2026-02-17 | size must be between 3 and 30       |
      | ncft      | bftg     | bcgt                | 46645895464 | 2026-02-15 | 2026-02-17 | must be a well-formed email address |
      | cxst      | last     | premagth@gmail.com  | 8795587970  | 2026-02-15 | 2026-02-17 | size must be between 11 and 21      |
      | atru      | last     | vfr.ploiu@gmail.com | 46645895464 |            | 2026-02-17 | must not be null                    |
      |atru      | last     | vfr.ploiu@gmail.com | 46645895464  |   2026-    | 2026-02-17 | Failed to create booking            |
      |atru      | last     | vfr.ploiu@gmail.com | 46645895464  |2026-02-17  | 02-17      | Failed to create booking            |
      
@CreateBookingerorrs
Scenario Outline: booking a room which is already booked
    Given user hits endpoint "api/booking"
    When user books the room with details "<firstname>","<lastname>","<email>","<phone>","<checkin>","<checkout>","<roomid>"
    Then the response status code should be 409

    Examples:
      | firstname | lastname  | email               | phone       | checkin    | checkout   |roomid|
      | kSDFb     | SDFSDf    | dsfkjhkjSD@gmail.com| 07358480685 | 2026-02-17 | 2026-02-18 |11|
      | mery      | kale      | mery.kale@gmail.com | 46645895464 | 2026-02-17 | 2025-02-18 |11|