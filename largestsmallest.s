        AREA PROGRAM,CODE,READONLY
START
     ENTRY
	 MOV R5,#04
	 LDR R1,=0x00008000
	 LDR R2,=0x00009000
	 LDR R3,[R1]
LOOP ADD R1,R1,#04
     LDR R4,[R1]
	 CMP R3,R4
	 BLS LOOP1
	 MOV R3,R4
LOOP1 SUBS R5,R5,#01
     CMP R5,#00
	 BNE LOOP
	 STR R3,[R2]
	 END