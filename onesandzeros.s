         AREA ONESANDZEROES ,CODE,READONLY
		ENTRY
START
		LDR R6,=0X8000; BASE ADDRESS FOR NUMBER
		LDR R0,[R6] 
		MOV R1,#32 ; TO BE DONE 32 TIMES
		MOV R2,#00; HOLDING COUNT OF NUMBER OF ONES
BACK	MOVS R0,R0,RRX; RIGHT ROTATE LSB INTO THE C FLAG
		BCC NEXT
		ADD R2,R2,#01 ;R2+=1
		
NEXT	SUBS R1,R1,#01
		BNE BACK ;LOOP
		MOV R3,#32
		SUB R3,R3,R2 ; NUMBER OF ZEROES
AGAIN   B AGAIN
		END