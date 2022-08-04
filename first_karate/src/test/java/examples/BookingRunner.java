package examples;

import com.intuit.karate.junit5.Karate;

class BookingRunner {
    
    @Karate.Test
    Karate authBookingTest() {
        return Karate.run("utils/AuthBooking.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate createBookingTest() {
        return Karate.run("utils/CreateBooking.feature").relativeTo(getClass());
    }

}
