#line 1 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
#line 1 "f:/documents/university work/year 3/semester a/rts semester a/cwnew/rtsa_cw_2014_backup 1/glcd_header.h"


char GLCD_DataPort at PORTD;
sbit GLCD_CS1 at RB0_bit;
sbit GLCD_CS2 at RB1_bit;
sbit GLCD_RS at RB2_bit;
sbit GLCD_RW at RB3_bit;
sbit GLCD_EN at RB4_bit;
sbit GLCD_RST at RB5_bit;

sbit GLCD_CS1_Direction at TRISB0_bit;
sbit GLCD_CS2_Direction at TRISB1_bit;
sbit GLCD_RS_Direction at TRISB2_bit;
sbit GLCD_RW_Direction at TRISB3_bit;
sbit GLCD_EN_Direction at TRISB4_bit;
sbit GLCD_RST_Direction at TRISB5_bit;
#line 22 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
void Sm_Glcd_char2(int y, int x, char ch);
void Sm_Glcd_out2(int y, int x, char *text);

void intOut(char x, char y, int val);
void printBar(char x, char y, int val, int max);
void storeAn3(char eepromadrs, int val);
int getAn3(char eepromadrs);
void showEepromval(int val, int max);
void runGraph();
void resetGraph();
int scanKeypad();

void main(void)
{
 int an3now;
 int an3max = 0;
 char key;
 char eepromloc = 0;
 int eepromval;
 int eeprommax;
 char graphclear = 1;

 Glcd_Init();

 Sm_Glcd_Out2(57, 67, "H.S.B V1.0");
 Sm_Glcd_Out2(51, 1, "AN3:");
 Sm_Glcd_Out2(37, 1, "ROM:");
 Sm_Glcd_Out2(0, 1, "MIN");
 Sm_Glcd_Out2(10, 1, "MAX");
 Sm_Glcd_Out2(20, 1, "MEAN");


 Glcd_H_Line(62, 126, 32, 1);
 Glcd_V_Line(0,32,62,1);

 ADCON1 = 0;

 eepromval = getAn3(eepromloc);
 showEepromval(eepromval,eeprommax);
 an3now = ADC_Read(3);
 intOut(26, 51, an3now);

 while(1)
 {
 an3max = an3now;
 eeprommax = eepromval;
 an3now = ADC_Read(3);

 key = scanKeypad();

 if(key == 1)
 {
 storeAn3(eepromloc, an3now);
 eepromval = an3now;
 }
 if(key == 2)
 {
 if(eepromloc == 0) eepromloc = 16;
 else if(eepromloc == 16) eepromloc = 32;
 else if(eepromloc == 32) eepromloc = 0;
 eepromval = getan3(eepromloc);
 }
 if(key == 4 && graphclear == 1)
 {
 graphclear = 0;
 runGraph();
 }
 if(key == 5 && graphclear == 0)
 {
 graphclear = 1;
 resetGraph();
 }
 key = 0;

 if(an3now != an3max)
 {
 intOut(26, 51, an3now);
 printBar(0, 59, an3now, an3max);
 }

 showEepromval(eepromval, eeprommax);
 }
}
#line 112 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
void intOut(char x, char y, int val)
{
 char out[7];

 IntToStr(val, out);
 Sm_Glcd_Out2(y, x, out);
}
#line 127 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
void printBar(char x, char y, int val, int max)
{
 char i, j;
 int trueval = val / 16;

 for(i = 0; i<4; i++)
 {
 Glcd_H_Line(x, trueval, y+i, 1);
 }
 for(j = 0; j<4; j++)
 {
 Glcd_H_Line(trueval, 64, y+j, 0);
 }
}
#line 149 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
void storeAn3(char eepromadrs, int val)
{
 EEPROM_Write(eepromadrs, val & 0xFF);
 Delay_Ms(5);
 EEPROM_Write(eepromadrs + 1, (val >> 8) & 0xFF);
 Delay_Ms(5);
}
#line 165 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
int getAn3(char eepromadrs)
{
 int val1;
 int val2;

 val1 = EEPROM_read(eepromadrs);
 Delay_Ms(5);
 val2 = EEPROM_read(eepromadrs + 1);
 return ((val1 & 0xFF) + ((val2 << 8) & 0xFF00));
}
#line 184 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
void showEepromval(int val, int max)
{
 if(val == 0)
 {
 intOut(26,37,0);
 }
 if(val != max)
 {
 if(val == -1)
 {
 Sm_Glcd_Out2(37,38,"????");
 printBar(0, 46, 0, max);
 }
 else
 {
 intOut(26,37,val);
 printBar(0, 46, val, max);
 }
 }
}
#line 210 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
void runGraph()
{
 int an3;
 int min;
 int max;
 unsigned int mean;
 char i;

 for(i = 0; i < 64; i++)
 {
 an3 = ADC_Read(3);

 if(i==0)min = an3;
 if(an3 > max)max = an3;
 if(an3 < min)min = an3;
 mean += an3;

 Glcd_V_Line(32,(32-(an3/32)),63+i,1);
 Delay_Ms(50);
 }
 intOut(26, 0, min);
 intOut(26, 10, max);
 intOut(26, 20, mean = (mean/64));
}
#line 239 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
void resetGraph()
{
 char i,j;

 for(i = 0; i<100; i++)
 {
 Glcd_V_Line(31,0,30+i,0);
 }
 Glcd_V_Line(0,32,62,1);
}
#line 256 "F:/Documents/University Work/Year 3/Semester A/RTS Semester A/CWNew/RTSA_CW_2014_Backup 10/RTSA_CW_2014.c"
int scanKeypad()
{
 int key;
 PORTC = 0b0100;
 TRISC = 0b0011;
 if(PORTC.RC0 == 1)key = 1;
 if(PORTC.RC1 == 1)key = 4;

 PORTC = 0b1000;
 if(PORTC.RC0 == 1)key = 2;
 if(PORTC.RC1 == 1)key = 5;
 return key;
}
