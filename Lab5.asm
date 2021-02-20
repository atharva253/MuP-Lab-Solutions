.model tiny
.data
str1 db 'Enter User Name:',0AH,'$'
max1 db 20
act1 db ?
ent1 db 20 DUP(00H)
usern db 'atharva253'
str2 db 'Enter Password:',0AH,'$'
max2 db 20
act2 db ?
ent2 db 20 DUP(00H)
passw db 'whatever'
str3 db 'Hello atharva253!!',0AH,'$'

.code
.startup
	CLD
	
	LEA DX,str1
	MOV AH,09H
	INT 21H
	
	LEA DX,max1
	MOV AH,0AH
	INT 21H
	
	LEA DI,ent1
	LEA SI,usern
	MOV CL,0AH
X1:	CMPSB
	JNZ Exit1
	DEC CL
	JNZ X1
	
	LEA DX,str2
	MOV AH,09H
	INT 21H
	
	LEA DX,max2
	MOV AH,0AH
	INT 21H
	
	LEA DI,ent2
	LEA SI,passw
	MOV CL,08H
X2:	CMPSB
	JNZ Exit1
	DEC CL
	JNZ X2
	
	LEA DX,str3
	MOV AH,09H
	INT 21H
		
Exit1:
.exit
end
	