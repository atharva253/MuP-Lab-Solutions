.model tiny
.data
fn1 db 'myfile.txt',0
txt1 db 'Atharva Joshi 2018A3PS0515P',0DH
sz1 db 28
.code
.startup
	
	LEA DX,fn1		;Creating file
	MOV CX,00H
	MOV AH,3CH
	INT 21H
	MOV BX,AX
	
	MOV AH,3DH		;Opening file
	MOV AL,02H
	LEA DX,fn1
	
	MOV CL,sz1		;Writing to file
	MOV CH,00H
	LEA DX,txt1
	MOV AH,40H
	INT 21H
	MOV AH,40H
	INT 21H
	
	MOV AH,3EH		;Closing the file
	INT 21H

.exit
end
	