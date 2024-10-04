// Name: Orchlon Chinbat
// Honor code: I pledge that this submission is solely my work, and that I have neither given, nor received help from anyone.
// Student ID: xxxxxxxx

import java.util.Scanner;

public class DecimalToBase {
    // Function to convert decimal to a given base
    public static String convertFromDecimal(int decimal, int base) {
        // Declare result variable, which is a return value of the Function
        StringBuilder result = new StringBuilder();
        
        // Edge case
        if (decimal == 0) {
            return "0";
        }
        
        // Loop until the quotient becomes 0
        while (decimal != 0) {
            int remaining = decimal % base;
            // Integer division
            decimal /= base; 
            
            // Convert remaining to appropriate character for hexadecimal
            if (base == 16 && remaining >= 10) {
                // Convert 10-15 to A-F
                result.insert(0, (char) ('A' + (remaining - 10))); 
            } else {
                // Insert the digit at the beginning
                result.insert(0, remaining); 
            }
        }
    
        // convert StringBuilder to String
        return result.toString();
    }

    // Main function to handle user input and output
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Ask the user to enter a decimal number
        System.out.print("Please enter a base 10 number: ");
        int decimalNumber = scanner.nextInt();

        // Declare binary, octal, and hexadecimal's bases
        int binaryBase = 2;
        int octalBase = 8;
        int hexadecimalBase = 16;

        // Convert to binary, octal, and hexadecimal
        String binaryResult = convertFromDecimal(decimalNumber, binaryBase);
        String octalResult = convertFromDecimal(decimalNumber, octalBase);
        String hexadecimalResult = convertFromDecimal(decimalNumber, hexadecimalBase);

        // Print the results
        System.out.println("Base 2: " + binaryResult);
        System.out.println("Base 8: " + octalResult);
        System.out.println("Base 16: " + hexadecimalResult);
    }
}
