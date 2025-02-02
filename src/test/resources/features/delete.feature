@delete
  Feature: DELETE A USER
    Background:
      Given url baseUrl
      Given path "/api/students"
      Scenario: delete a user
        When method get
        Then status 200
        * def studentId = response[0].id
        And path "/api/students", studentId
        Then method delete
        And print response
        And status 200
