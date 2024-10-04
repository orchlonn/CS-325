// Name: Orchlon Chinbat
// Honor code: I pledge that this submission is solely my work, and that I have neither given, nor received help from anyone.
// Student ID: xxxxxxxx

import java.util.Scanner;

public class BaseToDecimal {
    // Main function to handle user input and output
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // Declare base variable with dummy data of -1
        int base = -1;
        // Declare isCorrectBase boolean variable with initial data of false
        boolean isCorrectBase = false;
        // Declare a result
        int result = 0;
    
        // Loop until a valid base between 2 and 9 is entered
        while (!isCorrectBase) { 
            // Ask base number from user
            System.out.print("Please enter a base from 2 - 9: ");
            base = scanner.nextInt();
            if (base <= 9 && base >= 2) {
                // Set to true when valid base is entered
                isCorrectBase = true; 
            } else {
                // If invalid base entered, print the below message.
                System.out.println("Incorrect base system. Please enter a base from 2 - 9.");
            }
        }
    
        // Ask for the number in the given base from user
        System.out.print("Enter a base " + base + " number: ");
        String baseNumber = scanner.next();

        // length of the number
        int numberLength = baseNumber.length();
        for (int i = 0; i < numberLength; i = i + 1) {
            // Retrieve the digit at the "i"th position from the number string
            char digitChar = baseNumber.charAt(i);
            // Convert that char to integer
            int digit = Character.getNumericValue(digitChar);
                    
            // Algorithm 1
            result = result * base + digit;
        }

        // Print the result
        System.out.println("The equivalent number in base 10 format is " + result);
    }
}
