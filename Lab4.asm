.model tiny
.386
.data
dat1 dd 'math','have','    ','bury','mine','dine','    ','hell','deep','tree'
cnt1 dd 0AH
.code
.startup
	LEA DI,dat1
	MOV EAX,'    '
	CLD
	LEA SI,cnt1
	MOV CL,[SI]
	MOV CH,00H
	REPNE SCASD
X1:	CALL rev
	SCASD
	JNE X1
.exit
rev proc near
	MOV DL,[DI]
	XCHG DL,[DI+3]
	MOV [DI],DL
	MOV DL,[DI+1]
	XCHG DL,[DI+2]
	MOV [DI+1],DL
	ret
rev	endp
end	
