package utilities;

import java.util.Random;

public class GenerateRandomEmails {
    public static String generateRandomEmail(){
        int randomNumber= (int) (Math.random() * 100000);
        return "dev"+randomNumber+"@tekschool.com";
    }

}
