Feature: Booking - Put

  Background:
    * url "https://treinamento-api.herokuapp.com"
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

    @acceptance
    Scenario:  Alterar uma reserva usando o token
      * def booking = call read('classpath:examples/utils/CreateBooking.feature')
      * def bookingId = booking.response.bookingid
      * call read('classpath:examples/utils/AuthBooking.feature')
      * def bookingRequest  = read('classpath:examples/data/bookingPayload.json')
      * set bookingRequest.firstname = 'Carlos'
      * set bookingRequest.lastname = 'Silva'
      * set bookingRequest.totalprice = 150
      Given path 'booking/'+bookingId
      And header Cookie = "token="+tokenAuth
      And request bookingRequest
      When method put
      Then status 200
      * print response
