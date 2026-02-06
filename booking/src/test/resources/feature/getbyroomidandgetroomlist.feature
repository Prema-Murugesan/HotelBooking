@getByRoomid @hotelBookingRegression
Feature: Getting a room summary and roomlist

	@getByRoomidPositiveflow 
	Scenario Outline: Get the details of the room by room id
		Given user hits endpoint "api/room/","<roomid>"
		When user asks about the room
		Then the response status code should be 200
		Examples:
      		| roomid |
      		|   1    |
      		|        |  

	@getByRoomidError
	Scenario Outline: Get the details of the room by incorrect /invalid room id
		Given user hits endpoint "api/room/","<roomid>"
		When user asks about the room
		Then the response status code should be 404
		Examples:
      		| roomid |
      		|   a    |
      		|   $    |  
      
	@getRoomList
	Scenario: Get the details of the room by room id
		Given user hits endpoint "api/room"
		When user asks about the room
<<<<<<< HEAD
		Then the response status code should be 200
=======
		Then the response status code should be 200
>>>>>>> 57d923391696e1dfcc5aa99514298bceaf2b372b
