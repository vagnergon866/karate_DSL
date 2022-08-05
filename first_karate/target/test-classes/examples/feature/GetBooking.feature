Feature: Booking - Get

  Background:
    * url "https://treinamento-api.herokuapp.com/"


  @Contract
    Scenario: Garantir o contrato do retorno da lista de reservas
      Given path 'booking'
      And method get
      When status 200
      Then match each response == { bookingid: "#number" }

      #verificar schema de retorno
#    @Contract
#    Scenario: Garantir o contrato do retorno de uma reserva especifica
#      Given path 'booking/11'
#      When method get
#      Then status 418
#      * def booking = read('classpath:examples/data/bookingPayload.json')
#      And match response == booking

  @acceptance
  Scenario: Listar IDs das reservas
    Given path 'booking'
    When method get
    Then status 200

  @acceptance
  Scenario: Listar uma reserva específica
    Given path 'booking/1'
    When method get
    Then status 418

  @acceptance
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

  @acceptance
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

  @acceptance
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

  @acceptance
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

  @acceptance
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

  @acceptance
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