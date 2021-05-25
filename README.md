# computer-architecture-
Set 2:
1- Write, run and test a MIPS program to implement the following C code segment. (1 mark)
if ((g <= h) && (g > 0))
g = h;
else
h = g;
2- Develop an algorithm, test it and then implement it in MIPS assembly that takes an array of
characters and prints the number of vowels ('a', 'e', 'i', 'o', 'u') in it. Consider both upper and
lower cases. E.g., "Utility" prints 3. (1 mark)
3- Write, run and test a MIPS program to execute the following nested C loop. (1 mark)
for(i = 0; i < a; i++)
for(j = 0; j < i; j++)
C[i] += j;
4- Translate the following C program to MIPS assembly. Use the same structure. Do not write a
clever shorter program. (2 marks)
int main() {
...
t1 = isOdd (10);
printf ("%d", (t1 ? "odd" : "even");
...
}
int isOdd (int n) {
return !isEven (n);
}
int isEven (int n) {
return ((n % 2) == 0));
}
5- In A2 we designed a floating point multiplication unit. When a processor does not support
floating point arithmetic with hardware, it is still possible to support floating-point operations
using software libraries to simulate what the hardware would do. It is required to write a MIPS
function that takes two floating-point numbers using IEEE754 and adds them and returns the
result in a third register. (2 marks)
(Hint this will require separating the mantissa and exponent, adding the leading one, shifting the
mantissas with smaller exponent, adding mantissas together, normalizing the result. etc. Ignore
special cases like infinity, NaN, but consider the case of zero.)
