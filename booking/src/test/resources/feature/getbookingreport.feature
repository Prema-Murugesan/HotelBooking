@getbookingReport @hotelbookingregression
Feature: Get booking Report

@getbookingReportPositiveflow
Scenario: Get the details of the room by room id
	Given user hits endpoint "api/auth/login"
	When user enters "admin" and "password"
	Then the response status code should be 200 
	Given user hits endpoint "api/report"
	When user asks for the booking report
	Then the response status code should be 200

@getbookingReporterror
Scenario: Error scenario to check authorization without token
	Given user hits endpoint "api/report"
	When user asks for the booking report without token
	Then the response status code should be 401

	@getbookingReporterror1
Scenario: Error scenario to check authorization passing empty token
	Given user hits endpoint "api/report"
	When user asks for the booking report
	Then the response status code should be 500