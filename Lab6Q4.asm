.model tiny
.data
fn1 db 'myfile.txt',0
buff1 db 50
.code
.startup
	
		MOV AH,3DH		;Opening File
		MOV AL,02H
		LEA DX,fn1
		INT 21H
	
		LEA DX,buff1	;Reading from file
		MOV BX,AX		
rep1:	MOV AH,3F
		MOV CX,1
		INT 21H
		MOV AL,05H
		MOV DI,DX
		CMP [DI],AL
		JZ end1
		INC DX
		JMP rep1
		
end1:	MOV AL,'$'
		MOV DI,DX
		MOV [DI],AL
		
		MOV AH,09H		;Displaying data
		LEA DX,buff1
		INT 21H
		
		MOV AH,3EH		;Closing the file
		INT 21H
	
.exit
end