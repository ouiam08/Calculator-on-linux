# Calculator-on-bash-linux
Calculator on bash linux with graphique interface
using Whiptail linux command



The calculator starts when you press the start key, a window that contains choices (basic operations, advanced, numerical conversions and exit) will appear, the first choice (basic operations)
contains all the operations:
 Addition operations: the user must enter the list of operands to be added, in the code, we have used the shift command to shift the arguments. it must enter only numbers otherwise it will count as an error. the user can sum integers as well as floating point numbers.
 The same reasoning was used for the other basic operations.
 There is also the choice quit to exit the script, and cancel to either quit the script or return to the first page of choices depending on the user's desire.
 - The second choice is advanced operations:
   - The factorial which will calculate the factorial of positive numbers as well as negative numbers.
   - The power which will calculate the power of negative, positive and floating numbers, the power can also be a negative, positive or floating number.
   - Neperian logarithm which will calculate Ln of a number provided that the number is in the interval ]0,+infinity[ .
   - The calculation of trigonometric functions, the exponential and the square root of a positive number.
 There is also the choice quit to exit the script, and cancel to either quit the script or return to the first page of choices depending on the user's desire.
 - The third choice is the digital conversions:
    - Basic binary conversions in which we will calculate all types of binary conversions to other bases provided that the number entered by the user must be binary (just contains 0s and 1s).
    - Same reasoning for the other conversions with:<br />
      the octal number condition must be between 0 and 7.<br />
      the condition of the decimal number must be between 0 and 9<br />
      the condition of the hexadecimal number must be between 0 and 9 , A and F<br />
      (since the command does not process lowercase [A-Z] characters
      you have to convert what the user enters before doing the calculation).<br />
There is also the choice quit to exit the script, and cancel to either quit the script or return to the first page of choices depending on the user's desire.



 Done by KHDOUDRAJI OUIAM.
