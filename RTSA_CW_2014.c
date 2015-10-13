/*
    November 2014 Coursework Starter Project
    Demonstration of the small font library - designed to have a relatively
    low memory overhead.
    It is supplied by the Glcd_Small_Font2 binary (included as a part of this project)
    The library supplies two functions:
        void Sm_Glcd_char2(int y, int x, char ch);
        void Sm_Glcd_out2(int y, int x, char *text);
    x and y are the pixel coordinates of the start of writing cursor.
    The font is 5 characters wide by 7 characters high.
    The library will only display numeric digits, upper case letters
    and punctuation. Characters out of range are displayed as a question mark.

    You MUST use this specific starter project throughout the whole of this
    coursework, including the Glcd_Small_Font2 library which it contains.
*/

#include <GLCD_header.h>

//These two functions are supplied by the small font library
//X and Y are start positions measured in pixels from the top-left of the screen
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
    
    //Lines for graph
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

        if(key == 1) //store an3 value
        {
            storeAn3(eepromloc, an3now);
            eepromval = an3now;
        }
        if(key == 2) //switch eeprom bank and return value
        {
            if(eepromloc == 0) eepromloc = 16;
            else if(eepromloc == 16) eepromloc = 32;
            else if(eepromloc == 32) eepromloc = 0;
            eepromval = getan3(eepromloc);
        }
        if(key == 4 && graphclear == 1) //run graph if it is clear
        {
            graphclear = 0;
            runGraph();
        }
        if(key == 5 && graphclear == 0) //clear graph if it has been run
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

/**
    Outputs a given int to the x and y values on the LCD
    @param x - x coordinate on LCD
    @param y - y coordinate on LCD
    @param val - the int to output to the LCD
*/
void intOut(char x, char y, int val)
{
    char out[7];
    
    IntToStr(val, out);
    Sm_Glcd_Out2(y, x, out);
}

/**
    Outputs a bar of 4 pixles high and to a given length to 64 pixles max
    @param x - x coordinate on LCD
    @param y - y coordinate on LCD
    @param val - the current value
    @param max - the stored max value
*/
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

/**
    Stores a given int by splitting it into low and high order bits
    and puts them into banks next to each other
    
    @param eepromadrs - the starting address in EEPROM to store the split int
    @param val - the int to be stored
*/
void storeAn3(char eepromadrs, int val)
{
    EEPROM_Write(eepromadrs, val & 0xFF);
    Delay_Ms(5);
    EEPROM_Write(eepromadrs + 1, (val >> 8) & 0xFF);
    Delay_Ms(5);
}

/**
    Retrieves two values from EEPROM from the selected EEPROM location
    and adds them together to get the original int back from the store
    function
    
    @param eepromadrs - teh starting address in EEPROM to retrieve the values from
    @return - value in eepromadrs + eepromadrs+1 left shifted 8 (low + high order bits)
*/
int getAn3(char eepromadrs)
{
    int val1;
    int val2;

    val1 = EEPROM_read(eepromadrs);
    Delay_Ms(5);
    val2 = EEPROM_read(eepromadrs + 1);
    return ((val1 & 0xFF) + ((val2 << 8) & 0xFF00));
}

/**
    Function specific to the value retrieved from EEPROM. Displays
    correct format for the retrieved value in EEPROM and displays
    the bar for that value.
    
    @param val - the value that is currently selected
    @param max - the max value to print bar
*/
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

/**
    Displays a graph based off reading from AN3 every 50ms
    for 64 points. When plotting is finished min, max and mean values
    are displayed.
*/
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

/**
    Resets the graph, the min, max, mean values and redraws
    the verticle axis of the graph.
*/
void resetGraph()
{
    char i,j;
    
    for(i = 0; i<100; i++)
    {
        Glcd_V_Line(31,0,30+i,0);
    }
    Glcd_V_Line(0,32,62,1);
}

/**
    Scans the keypad using PORTC RC0-RC3 to detect for key presses
    on RC0 and RC1. High voltage is output on RC2 and then RC3 to
    distinguish each key seperatly on each row.
    @return key
*/
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