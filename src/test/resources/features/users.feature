@Regression
  Feature: test users endpoint

    Background:
      Given url "https://jsonplaceholder.typicode.com"
      Given path "/users"

      @user_1
    Scenario: validate users from base url/users
      When method get
      Then status 200

        @user_2
      Scenario: validate users from base url/users and check it is not null
        When method get
        Then status 200
        And match response !=null

          @user_3
          Scenario: validate user from base url/users check it is not null and print them
            When method get
            Then status 200
            And match response !=null
            And print response
