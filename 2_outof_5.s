	AREA PROGRAM,CODE, READONLY
	ENTRY
	
START
   
       LDR R6,=0x00008000
	   LDRB R0,[R6],#01
	   ANDS R3,R0,#0x0E
	   BNE EXIT
	   MOV R1,#0x05
	   MOV R2,#0X00
	   
BACK   MOVS R0,R0,RRX
       BCC NEXT
	   ADD R2,R2,#01
	   
NEXT   SUB R1,R1,#01
       BNE BACK
	   CMP R2,#02
	   BNE EXIT
	   MOV R4,#0xFF
	   
EXIT   STRB R4,[R6]

	END