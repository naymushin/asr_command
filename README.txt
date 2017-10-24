Command ASR (arithmetic shift right) ñ shift of two-byte binary number
for 1 position to the right. Number is presented in twoís complement code
format, therefore new highest bit value is equal to former highest bit
value in order to save sign of source number.

Machine code of ASR command is represented in octal format 0060DD,
where DD ñ is destination, i.e. there are 3 bits for register number plus
3 bits for indicating mode of addressing.
There are group of bits 010 (autoincrement direct addressing) and 011
(autoincrement indirect addressing) for indicating mode of addressing.

I selected 000 as number of register, that is R0, though itís possible
to use any of registers R0-R5 to write command in cells 0AF0h and 0AF1h.
Register R6 (SP ñ stack pointer) increases by 1 after execution the command
(in the task with indirect addressing). Register R7 (PC ñ program counter)
imitates program counter of 16bit processor MP1801. I write number, which
should be arithmetically shifted, to two (because number has two-byte length)
memory cells: 0B00h and 0B01h, i.e. in register R0 ñ in the task with direct
addressing. In the task with indirect addressing I write to registers R0 and
R1 addresses of memory cells, which contains two bytes of number. For both
modes of addressing result of command execution will be written in register R2. 

Program written in i8080 assembler analyzes entered command and apply it to
data in register R0.

Command with autoincrement direct addressing in binary format looks like
this - 0000 1100 0000 0010 (there were difficulties at this stage because format
for commands for this processor looks as follows: ’’’’’’8, i.e. 6 octal characters.
But after conversion it to binary code weíll have already 6 * 3 = 18 binary
characters, while registers are 16-bit. Have a look after machine codes for
assembler mnemonics, Iíve noticed all of them in highest octal position contain
either 0, or 1. Therefore, in binary format of this octal number it makes sense
to write only lowest position, rejecting two other, because they always contains
zero, so it helps to reduce amount of positions from 18 to 16).

Hexadecimal format - 0—02

Command with autoincrement indirect addressing:
In binary format - 0000 1100 0000 0011
In hexadecimal format ñ 0—03