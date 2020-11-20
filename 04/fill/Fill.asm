// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
    @i
    M=0

    @KBD
    D=M             // Store pressed key in D register

    @CLEAR          // If key is not pressed goto CLEAR
    D;JEQ
    @FILL           // otherwise goto FILL
    0;JEQ

(CLEAR)
    @state
    M=0
    @CHANGE_SCREEN
    0;JMP

(FILL)
    @state
    M=-1
    @CHANGE_SCREEN
    0;JMP

(CHANGE_SCREEN)
    @i
    D=M
    @8192       // (32 words) * (256 rows)
    D=A-D       // (Total words) - (Current row)
    @END
    D;JEQ

    @i
    D=M
    @SCREEN
    D=D+A

    @word
    M=D
    @state
    D=M
    @word
    A=M
    M=D

    @i
    M=M+1
    @CHANGE_SCREEN
    0;JMP


(END)
    @LOOP
    0;JMP // always go back to the beginning
