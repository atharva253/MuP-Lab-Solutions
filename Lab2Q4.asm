.MODEL TINY
.DATA
ARRAY1 DW 3467H,8923H,0A342H,5612H,0CDCCH,1223H
COUNT EQU 6
NEG1 DB ?
.CODE
.STARTUP
	LEA SI,ARRAY1
	LEA DI,NEG1
	MOV CL,COUNT
	MOV CH,00H
X2:	MOV AX,[SI]
	CMP AX,00H
	JG X1
	INC CH
X1:	ADD SI,0002H
	DEC CL
	JNZ X2
	MOV [DI],CH
.EXIT
END