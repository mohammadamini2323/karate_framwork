
@treeREQ
Feature: testing update student to the local data base
  Background:
    Given url baseUrl
    Given path "/api/students"

    * def emailUtility = Java.type('utilities.GenerateRandomEmails')
    * def randomEmail = emailUtility.generateRandomEmail()
    * def studentName = "jack"
    * def requestData = karate.read('classpath:data/users.json')
   * requestData.email=randomEmail
  @users_4
  Scenario: adding a student by randomEmail
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
    And print studentEmail

    Given path "/api/students", studentId
    * def newRandomEmail = emailUtility.generateRandomEmail()
    And request {"name": "#(studentName)","email":"#(newRandomEmail)"}
    When method put
    Then status 200
    And match response.email == newRandomEmail
    And print response.email

    When method get
    Then status 200
