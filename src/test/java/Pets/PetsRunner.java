package Pets;

import com.intuit.karate.junit5.Karate;

public class PetsRunner {
    @Karate.Test
    Karate runPets() {
        return Karate.run("pets").relativeTo(getClass());

    }



}
