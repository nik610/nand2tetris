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

(AGAIN)
@SCREEN
D=A
@addr
M=D //addr=16384

@8192
D=M
@n
M=D //n=8192

@i
M=0 //i=0

@KBD
D=M
@BLACK
D;JGT
@WHITE
D;JEQ

(BLACK)
  @i
  D=M
  @n
  D=D-M
  @END
  D;JGT 

  @addr
  A=M
  M=-1

  @i
  M=M+1
  @1
  D=A
  @addr
  M=D+M //addr=addr+1
  @BLACK
  0;JMP  
  
(WHITE)
  @i
  D=M
  @n
  D=D-M
  @END
  D;JGT 

  @addr
  A=M
  M=0

  @i
  M=M+1
  @1
  D=A
  @addr
  M=D+M
  @WHITE
  0;JMP    

(END)  
@AGAIN
0;JMP
  
