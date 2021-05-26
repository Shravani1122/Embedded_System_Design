#include<LPC17xx.H>
void uart0_init(void);
int main()
{
unsigned char i;
unsigned char str1[]="PES UNIVERSITY";
SystemInit();
uart0_init();
for(i=0; i<str1[i]!='\0'; i++)
{
LPC_UART0->THR=str1[i];
while((LPC_UART0->LSR & 0x20)!=0x20);
}
}
void uart0_init(void)
{
LPC_PINCON->PINSEL0=0x00000050;
LPC_UART0->LCR=0x83;
LPC_UART0->DLM=0x00;
LPC_UART0->DLL=0x75;
LPC_UART0->FDR=0x00000010;
LPC_UART0->LCR=0x03;
}