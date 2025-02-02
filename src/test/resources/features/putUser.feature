@updateStudent
Feature: testing update student to the local data base
  Background:

    * def emailUtility = Java.type('utilities.GenerateRandomEmails')
    * def randomEmail = emailUtility.generateRandomEmail()
    * def studentName = "jack"
  @users_4
  Scenario: adding a student by randomEmail
    Given url "http://localhost:3000"
    Given path "/api/students"
    And request {"name": "#(studentName)","email":"#(randomEmail)"}
    And print randomEmail
    When method post
    Then status 201
    And match response !=null
    And match response.name == studentName
    And match response.email == randomEmail
    * def studentId = response.id
    * def studentEmail = response.email
    And print studentId

    Given url "http://localhost:3000"
    Given path "/api/students/"+studentId
    * def newRandomEmail = emailUtility.generateRandomEmail()
    And request {"name": "#(studentName)","email":"#(newRandomEmail)"}
    When method put
    Then status 200
    And match response.email == newRandomEmail

