Feature: Booking - Create

  Background:
    * url "https://treinamento-api.herokuapp.com/"
    * header Content-Type = 'application/json'
    * header Acept = 'application/json'
    * def requestBooking = read('classpath:examples/data/bookingPayload.json')

    @acceptance
    Scenario: Criar uma reserva
      Given path 'booking'
      And request requestBooking
      When method POST
      Then status 418




