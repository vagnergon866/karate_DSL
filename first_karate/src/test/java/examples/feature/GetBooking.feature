Feature: Booking - Get

  Background:
    * url "https://treinamento-api.herokuapp.com/"
    * call read('classpath:examples/utils/AuthBooking.feature')
    * header Accept = 'application/json'


    Scenario: Garantir o contrato do retorno da lista de reservas
      Given path 'booking'
      And method get
      When status 200
      Then match each response == { bookingid: "#number" }



  Scenario: Listar IDs das reservas
    Given path 'booking'
    When method get
    Then status 200


  Scenario: Listar uma reserva específica
    Given path 'booking/1'
    When method get
    Then status 200


  Scenario Outline: Listar IDs de reservas utilizando o filtro <parametro>
    * def varParams = <valorParametro>
    Given path 'booking'
    And params varParams
    When method get
    Then status 200
    * print response

    Examples:
    | parametro | valorParametro    |
    | firstname | {firstname: Will} |


  Scenario Outline: Listar IDs de reservas utilizando o filtro <parametro>
    * def varParams = <valorParametro>
    Given path 'booking'
    And params varParams
    When method get
    Then status 200
    * print response

    Examples:
    | parametro| valorParametro     |
    | lastname | {lastname:'Smith'} |


  Scenario Outline: Listar IDs de reservas utilizando o filtro <parametro>
    * def varParams = <valorParametro>
    Given path 'booking'
    And params varParams
    When method get
    Then status 200
    * print response

    Examples:
    | parametro | valorParametro         |
    | checkin   | {checkin:'2018-01-01'} |


  Scenario Outline: Listar IDs de reservas utilizando o filtro <parametro>
    * def varParams = <valorParametro>
    Given path 'booking'
    And params varParams
    When method get
    Then status 200
    * print response

    Examples:
    | parametro| valorParametro          |
    | checkout | {checkout:'2019-01-01'} |


  Scenario Outline: Listar IDs de reservas utilizando o filtro <parametro>
    * def varParams = <valorParametro>
    Given path 'booking'
    And params varParams
    When method get
    Then status 200
    * print response

    Examples:
    | parametro            | valorParametro                                  |
    | checkin and checkout | {checkin:'2018-01-01'}, {checkout:'2019-01-01'} |


  Scenario Outline: Listar IDs de reservas utilizando o filtro <parametro>
    * def varParams = <valorParametro>
    Given path 'booking'
    And params varParams
    When method get
    Then status 200
    * print response

    Examples:
    | parametro                       | valorParametro                                                      |
    | name, checkin and checkout date | {firstname: 'Will'}, {checkin:'2018-01-01'}, {checkout:'2019-01-01'}|