@login  @hotelBookingRegression
Feature: Login Functionality
   
   @loginPositiveflow
   Scenario Outline: Successful login with valid user name and password
      Given user hits endpoint "api/auth/login"
      When user enters "<username>" and "<password>"
      Then the response status code should be 200
      Examples:
         | username | password | 
         | admin    | password | 
   
   @loginError
   Scenario Outline: Failed login with invalid/incorrect user name and password
      Given user hits endpoint "api/auth/login"
      When user enters "<username>" and "<password>"
      Then the response status code should be 401
      Examples:
         | username | password | 
         | ad       | password | 
         | admin    | pass     |
         |          | password |
         | admin    |          |
         | @%(      | password |
         | admin    | @%(      |

<<<<<<< HEAD
    
=======
    
>>>>>>> 57d923391696e1dfcc5aa99514298bceaf2b372b
