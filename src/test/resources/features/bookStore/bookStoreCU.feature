@bookStore
  Feature: access to get request
    Background:
      Given url "https://bookstore.demoqa.com"
      * def requestUser = karate.read('classpath:data/bookstoreUser.json')
      * def generateTokenReader = call read('classpath:features/bookStore/generateToken.feature')
      * def userToken = generateTokenReader.userToken

      Scenario: Create a user whit pass and name
        Given path "/Account/V1/User"
        When request requestUser
        And method post
        And status 201
        Then print response
        And match response != null
        * def userID = response.userId
        #@unAuthorizedREQUEST
          Given path "/Account/V1/User" , userID
          When method get
          Then status 200
          And print response
       # @AuthorizedRequest
            Given path "/Account/V1/User",userID
            And header Autorization = 'Bearer' , userToken
            And method get
            Then status 200
            And print response

