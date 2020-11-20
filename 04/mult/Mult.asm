// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Multiplication can also be thought of as a sum.
// a*b = b + b + ... + b
// where the sum of b's has a-many b's

    // a = R0 and b = R1
    // Using i to keep track of how many b's we've summed
    @i
    M=0

    // Record the output in R2
    @R2
    M=0

(LOOP)
    // If we've summed a many b's then we're done
    @i
    D=M

    @R0
    D=D-M       // a - i
    @END
    D;JEQ       // If a - i = 0 goto END (i.e if we've summed a-many b's then we're done)

    @R1
    D=M         // Store b in the D register

    @R2
    M=D+M       // R2 += b

    @i
    M=M+1       // i += 1
    @LOOP
    0;JMP       // Back to the start
(END)
    @END
    0;JMP
