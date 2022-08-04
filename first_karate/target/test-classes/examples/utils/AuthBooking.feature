Feature: Booking - Auth

  Background:
    * def requestToken = read('classpath:examples/data/authPayload.json')

  Scenario: Gerar token
    Given url 'https://treinamento-api.herokuapp.com/auth'
    And header Content-Type = 'application/json'
    And request requestToken
    When method post
    * print response
    * def tokenAuth = response.token
    * print tokenAuth
    Then match response.token == tokenAuth
