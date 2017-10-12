/*********************************************
Author: Anil 
Created Date: 29/06/2016
Purpose: To Get the Unique Random string 
based on the Specified length,


***********************************************/

public class RandomStringGenerator {
public RandomStringGenerator (){

}

/* It can be used without instance like a sytem defined methods */
/*This  Integer param is to Specify Lenght of String */
public static String generateRandomString(Integer LengthOfString) {
    final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
    String randStr = '';
    while (randStr.length() < LengthOfString ) {
       Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
       randStr += chars.substring(idx, idx+1);
    }
    return randStr; 
}
}