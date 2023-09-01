Feature: Booking - Post

  Background:
    * url "https://treinamento-api.herokuapp.com/"
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

   Scenario: Criar uma nova reserva
     * def requestBooking = read('classpath:examples/data/bookingPayload.json')
     Given path 'booking'
     And request requestBooking
     When method post
     Then status 200
     * print response

     
