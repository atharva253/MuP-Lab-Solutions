.model tiny
.data
fn1 db 'myfile.txt',0
txt1 db 'BUDH 2105',0DH
sz1 db 10
.code
.startup
	
	MOV AH,3DH		;Opening File
	MOV AL,02H
	LEA DX,fn1
	INT 21H
	
	MOV BX,AX
	MOV CX,0
	MOV DX,0
	MOV AH,42H
	MOV AL,02H
	INT 21H
	
	MOV CL,sz1		;Writing to file
	MOV CH,00H
	LEA DX,txt1
	MOV AH,40H
	INT 21H
		
	MOV AH,3EH		;Closing the file
	INT 21H

.exit
end
