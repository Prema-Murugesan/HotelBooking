@GetbookingReport @hotelbookingregression
Feature: Get booking Report

@GetbookingReportPositiveflow
Scenario: Get the details of the room by room id
	Given user hits endpoint "api/auth/login"
	When user enters "admin" and "password"
	Then the response status code should be 200 
	Given user hits endpoint "api/report"
	When user asks for the booking report
	Then the response status code should be 200

@GetbookingReporterror
Scenario: Get the details of the room by room id 
	Given user hits endpoint "api/report"
	When user asks for the booking report without token
	Then the response status code should be 401
