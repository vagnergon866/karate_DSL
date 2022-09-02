Feature: Booking - Put

  Background:
    * call read('classpath:examples/common/common.feature')
    * url "https://treinamento-api.herokuapp.com"
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * call read('classpath:examples/utils/AuthBooking.feature')
    * def booking = call read('classpath:examples/utils/CreateBooking.feature')
    * def bookingId = booking.response.bookingid
    * def bookingRequest  = read('classpath:examples/data/bookingPayload.json')


    Scenario:  Alterar uma reserva usando o token
      * def retornaValor = new RetornaValor();
      * def alteraFirstname = retornaValor.valorNome();
      * set bookingRequest.firstname = alteraFirstname
      Given path 'booking/'+bookingId
      And header Cookie = "token="+tokenAuth
      And request bookingRequest
      When method put
      Then status 200
      * print response


   Scenario Outline: Alterar uma reserva, outra forama de manipular dados <cenario>
     * set bookingRequest.firstname = <valorParametro>
     * set bookingRequest.lastname = <valorParametro2>
     * print bookingRequest
     Given path 'booking/'+bookingId
     And header Cookie = "token="+tokenAuth
     And request bookingRequest
     When method put
     Then status 200

     Examples:
     | cenario              | valorParametro  | valorParametro2 |
     | para alterar o nome  |    'Teste'      |    'Testando'   |


   Scenario: Tentar alterar uma reserva quando o token não for enviado
     * set bookingRequest.totalprice = 525
     Given path 'booking/'+bookingId
     And request bookingRequest
     When method put
     Then status 403


  Scenario: Alterar uma reserva usando o Basic auth
    * set bookingRequest.totalprice = 564
    Given path 'booking/'+bookingId
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    And request bookingRequest
    When method put
    Then status 200



  Scenario: Tentar alterar uma reserva quando o token não for enviado
    * set bookingRequest.firstname = 'Tom'
    Given path 'booking/' +bookingId
    And request bookingRequest
    When method put
    Then status 403


  Scenario: Tentar alterar uma reserva quando o token enviado for inválido
    * set bookingRequest.firstname = 'Holland'
    Given path 'booking/' +bookingId
    And header Cookie = "token="+123213
    And request bookingRequest
    When method put
    Then status 403


  Scenario: Tentar alterar uma reserva que não existe
    * set bookingRequest.firstname = 'Andrew'
    Given path 'booking/' +0
    And header Cookie = "token="+tokenAuth
    And request bookingRequest
    When method put
    Then status 405












