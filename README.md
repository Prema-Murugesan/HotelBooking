#Rest-Assured Cucumber BDD Framework
---------------------------------------------------------------------------------
**Key features in the framework:**
----------------------------------------------------------------------------------
*Test automation framework using Rest-Assured for testing the hotel room booking API   
*Cucumber is used for BDD  
*Feature file has all test case  
*Common methods are placed in Utilities class  
*Junit is used for test execution  
*Tests can be executed with Tags marked at feature level and scenario level based on the type of test scenarios  

**Prerequisites:**
---------------------------------------------------------------------------------------
*Java 8+  
*Maven - To manage dependencies  
*IDE ( Eclipse)   

**Libraries and Tools Used:**
----------------------------------------------------------------------------------------
1.Rest-Assured: For API Testing  
2.Cucumber: For Behavior-Driven Development (BDD)  
3.JUnit: To execute Cucumber test  

**Installation**
----------------------------------------------------------------------------------------
Clone the repository: git clone https://github.com/Prema-Murugesan/HotelBooking.git

**How to Run the Tests**
-----------------------------------------------------------------------------------------

*To execute the tests go to runner.class(src/test/java/runnerfile/runner.java)  
*we can use different tags:@CreateBooking , @GetbookingReport , @EditBooking  , @DeleteBooking  
*After Executing to see the report go to target folder and open "cucumber-report.html" in web browser 
