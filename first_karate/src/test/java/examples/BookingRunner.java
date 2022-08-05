package examples;

import com.intuit.karate.junit5.Karate;

class BookingRunner {
    
    @Karate.Test
    Karate authBookingTest() {
        return Karate.run("utils/AuthBooking.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate postBookingTest() {
        return Karate.run("feature/PostBooking.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate getBookingTest() {
        return Karate.run("feature/GetBooking.feature").relativeTo(getClass());
    }


}
