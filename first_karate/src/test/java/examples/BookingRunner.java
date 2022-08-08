package examples;

import com.intuit.karate.junit5.Karate;

class BookingRunner {
    
    @Karate.Test
    Karate authBookingTest() {
        return Karate.run("utils/AuthBooking.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate CreateBookingTest() {
        return Karate.run("utils/CreateBooking.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate getBookingTest() {
        return Karate.run("feature/GetBooking.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate putBookingTest() {
        return Karate.run("feature/PutBooking.feature").relativeTo(getClass());
    }

}
