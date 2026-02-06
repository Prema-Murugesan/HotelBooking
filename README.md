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
Download the "booking.zip" file from repository: https://github.com/Prema-Murugesan/HotelBooking.git  
Extract the file in local  
Go to Eclipse->File-> Import->Maven->Existing Maven Project->click Next Button  
Click Browse button to get the location of downloaded and extracted project  
Click Finish button

**How to Run the Tests**
-----------------------------------------------------------------------------------------

*To execute the tests go to runner.class(src/test/java/runnerfile/runner.java)  
*we can use different tags:@CreateBooking , @GetbookingReport , @EditBooking  , @DeleteBooking  ,@hotelBookingRegression
*After Executing to see the report go to "src/test/resources" folder and open "cucumber-report.html" in web browser  
**NOTE:**There are sample files available in the same location.
