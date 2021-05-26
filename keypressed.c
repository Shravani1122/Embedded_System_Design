#include<LPC17xx.h>
int uart0_init(void);
void delay(unsigned long int x);
unsigned char val;
int main()
{
	SystemInit();
	LPC_GPIO1->FIOMASK3=0xEF;
	LPC_GPIO1->FIODIR3 = 0x10;
	LPC_PINCON->PINSEL0 = 0x00000050;
	uart0_init();
	while(1)
	{
		while(((LPC_UART0->LSR&0x01)!=0x01));
		val = LPC_UART0->RBR;
		if(val=='1')
		{
			LPC_GPIO1->FIOSET3 = 0x10;
		}
		else if(val=='0')
		{
			LPC_GPIO1->FIOCLR3 = 0x10;
		}
		else;
	}
}
int uart0_init(void)
{
	LPC_UART0->LCR = 0x83;
	LPC_UART0->DLM = 0x00;
	LPC_UART0->DLL = 0x75;
	LPC_UART0->FDR = 0x00000010;
	LPC_UART0->LCR = 0x03;
}
