# Integer-Division-in-NASM-x86-Assembly-
A simple NASM x86 32-bit assembly program that prompts the user for two single-digit numbers, divides them using integer division, and prints both the quotient and remainder. The program handles input/output via Linux system calls and converts ASCII characters to integers for arithmetic operations.

 - Uses int 0x80 system calls for I/O (sys_read and sys_write).
 - Converts ASCII inputs into integers using subtraction of '0'.
 - Performs division with idiv, handling signed division.
 - Converts results back into ASCII characters for display.
 - Manages basic memory and buffer allocation in .data and .bss.
 - Includes newline formatting for better user readability.
