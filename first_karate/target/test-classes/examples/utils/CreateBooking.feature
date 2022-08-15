Feature: Booking - Post

  Background:
    * url "https://treinamento-api.herokuapp.com/"
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

   @acceptance
   Scenario: Criar uma nova reserva
     * def requestBooking = read('classpath:examples/data/bookingPayload.json')
     Given path 'booking'
     And request requestBooking
     When method post
     Then status 200
     * print response



#   function(args) {
#   var RabbitMQ = Java.type('srec.services.support.javautils.utils.RabbitMQ');
#   var rabbitmqProducer = new RabbitMQ();
#   return rabbitmqProducer.write(args);
#   }
