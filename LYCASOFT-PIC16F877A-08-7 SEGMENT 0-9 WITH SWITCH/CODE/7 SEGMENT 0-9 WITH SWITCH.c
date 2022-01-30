#include<pic.h>
#include<htc.h>
# define _XTAL_FREQ 20e6
__CONFIG(0X3F3A);

#define SW RB7

char DIG[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0xff,0x67};			//comman cathode type;
//char DIG[10]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};			//comman anode type;

int Count;

void main()
{
	TRISB=0X80;
	PORTB=0X00;
	
	while(1)
	{
		while(SW==1)
		{
			PORTB=DIG[Count];
			Count++;
			if(Count>=10)
			{
				Count=0;
			}
			while(SW==1);
		}
	}
}