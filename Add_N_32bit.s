        AREA PROGRAM,CODE,READONLY
START
     ENTRY
	 LDR R7,=0x00000000
	 LDR R0,=0x0000800
	 LDR R1,=0x00009000
	 LDR R3,=0x00000005
	 LDR R4,[R0]
	 SUB R3,R3,#01
BACK LDR R5,[R0,#0x04]
     ADDS R4,R4,R5
	 BCC next
	 ADD R7,R7,#01
next SUBS R3,R3,#0x01
     BNE BACK
	 STR R7,[R1]
	 STR R4,[R1,#0x04]
AGAIN B AGAIN
     END