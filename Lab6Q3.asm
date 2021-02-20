.model tiny
.data
fn1 db 'myfile.txt',0
buff1 db 67 DUP(?)
.code
.startup
	
	MOV AH,3DH		;Opening File
	MOV AL,02H
	LEA DX,fn1
	INT 21H
	
	MOV BX,AX		;Reading from file
	MOV AH,3FH
	MOV CX,66
	LEA DX,buff1
	INT 21H
	ADD DX,65
	MOV DI,DX
	MOV AL,'$'
	MOV [DI],AL
	
	MOV AH,09H		;Displaying data
	LEA DX,buff1
	INT 21H
	
	MOV AH,3EH		;Closing the file
	INT 21H
	
.exit
end
	
	