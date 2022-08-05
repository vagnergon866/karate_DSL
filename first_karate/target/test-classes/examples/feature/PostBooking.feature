Feature: Booking - Post

  Background:
    * url "https://treinamento-api.herokuapp.com/"
    * header Content-Type = 'application/json'
    * header Acept = 'application/json'
    * def requestBooking = read('classpath:examples/data/bookingPayload.json')

   @acceptance
   Scenario: Criar uma nova reserva
     Given path 'booking'
     And request requestBooking
     When method post
     Then status 418

