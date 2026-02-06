@getBookingReport @hotelBookingRegression
Feature: Get booking Report

	@getBookingReportPositiveflow
	Scenario: Get the details of the room by room id
		Given user hits endpoint "api/auth/login"
		When user enters "admin" and "password"
		Then the response status code should be 200 
		Given user hits endpoint "api/report"
		When user asks for the booking report
		Then the response status code should be 200

	@getBookingReportError
	Scenario: Error scenario to check authorization without token
		Given user hits endpoint "api/report"
		When user asks for the booking report without token
		Then the response status code should be 401

	@getBookingReportError
	Scenario: Error scenario to check authorization passing empty token
		Given user hits endpoint "api/report"
		When user asks for the booking report
<<<<<<< HEAD
		Then the response status code should be 500
=======
		Then the response status code should be 500
>>>>>>> 57d923391696e1dfcc5aa99514298bceaf2b372b
