@createStudent
  Feature: testing create student to the local data base
    Background:
      Given url "http://localhost:3000"
      Given path "/api/students"
      * def emailUtility = Java.type('utilities.GenerateRandomEmails')
      * def randomEmail = emailUtility.generateRandomEmail()
      * def studentName = "jack"
      @users_4
      Scenario: adding a student by randomEmail
        And request {"name": "#(studentName)","email":"#(randomEmail)"}
        And print randomEmail
        When method post
        Then status 201
        And match response !=null
        And match response.name == studentName
        And match response.email == randomEmail
        And print studentId