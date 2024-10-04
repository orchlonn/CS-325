import java.util.Scanner;

public class DecimalToBase {

    // Function to convert decimal to a given base
    public static String convertFromDecimal(int decimal, int base) {
        // StringBuilder result = new StringBuilder();
        String result = "";
        
        // Edge case #1
        if (decimal == 0) {
            return "0";
        }

        // Loop until the quotient becomes 0
        while (decimal != 0) {
            int remainder = decimal % base;
            // Integer division
            decimal /= base; 
            result += remainder;
        }

        // If the length of the result is greater than 1, reverse the string
        if (result.length() > 0) {
            String temp = "";
            // The following iteration will work right to left, which "i" will be last element and put the last into the temporary first element
            for (int i = result.length() - 1; i >= 0; i--) {
                temp += result.charAt(i);
            }
            // Assign reversed temp value to result
            result = temp;
        }
        
        // return the result
        return result;
    }

    public static String convertToHex(int decimal, int base) {
        // Declare an empty string to hold the hexadecimal value
        String hex = ""; 
        int remainder;

        // Edge case 
        if (decimal == 0) {
            return "0";
        }
        // Loop until the decimal number is 0
        while (decimal > 0) {
             // Get the remainder
            remainder = decimal % 16;
            // Convert the remainder to the corresponding hex character
            if (remainder < 10) {
                // Prepend the character for numbers 0-9
                hex = (char) (remainder + '0') + hex; 
            } else {
                // Prepend the character for numbers A-F
                hex = (char) (remainder - 10 + 'A') + hex;
            }
            // Divide the number by 16
            decimal /= 16; 
        }
        // Return the final hexadecimal string
        return hex;
    }

    // Main function to handle user input and output
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Ask the user to enter a decimal number
        System.out.print("Please enter a base 10 number: ");
        int decimalNumber = scanner.nextInt();

        // Convert to binary, octal, and hexadecimal
        String binaryResult = convertFromDecimal(decimalNumber, 2);
        String octalResult = convertFromDecimal(decimalNumber, 8);
        String hexadecimalResult = convertToHex(decimalNumber, 16);

        // Output the results
        System.out.println("Base 2: " + binaryResult);
        System.out.println("Base 8: " + octalResult);
        System.out.println("Base 16: " + hexadecimalResult);
    }
}