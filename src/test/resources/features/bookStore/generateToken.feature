@genTok
  Feature: generate a token
    Background:
      Given url 'https://bookstore.demoqa.com'
      * def requestUser = karate.read('classpath:data/bookstoreUser.json')
      Scenario: generate token and define it
        Given path "/Account/v1/GenerateToken"
        Then request requestUser
        Then method post
        And status 200
        Then print response
        And match response !=null
        * def userToken = response.token
