.model tiny
.data
strn db 'Hi my name is Atharva! What is your name?'
scnt db 40
str1 db 'name'
strc db 4
rword db 'life'
.code
.startup
	LEA DI,strn
	LEA SI,str1
	CLD
	MOV CL,strc
	MOV CH,scnt
	
searching:	
	CMPSB
	JNZ refresh
	DEC CL
	JZ found
	DEC CH
	JZ exit
	JMP searching
	
refresh:
	DEC CH
	LEA SI,str1
	MOV CL,strc
	JMP searching
	
found:
	LEA SI,rword
	MOV CH,00H
	MOV CL,strc
	SUB DI,CX
	REP MOVSB
	
exit: 
.exit
end
