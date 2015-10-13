
_main:

;RTSA_CW_2014.c,34 :: 		void main(void)
;RTSA_CW_2014.c,37 :: 		int an3max = 0;
	CLRF       main_an3max_L0+0
	CLRF       main_an3max_L0+1
	CLRF       main_eepromloc_L0+0
	MOVLW      1
	MOVWF      main_graphclear_L0+0
;RTSA_CW_2014.c,44 :: 		Glcd_Init();
	CALL       _Glcd_Init+0
;RTSA_CW_2014.c,46 :: 		Sm_Glcd_Out2(57, 67, "H.S.B V1.0");
	MOVLW      57
	MOVWF      FARG_Sm_Glcd_out2_y+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_y+1
	MOVLW      67
	MOVWF      FARG_Sm_Glcd_out2_x+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_x+1
	MOVLW      ?lstr1_RTSA_CW_2014+0
	MOVWF      FARG_Sm_Glcd_out2_txt+0
	CALL       _Sm_Glcd_out2+0
;RTSA_CW_2014.c,47 :: 		Sm_Glcd_Out2(51, 1, "AN3:");
	MOVLW      51
	MOVWF      FARG_Sm_Glcd_out2_y+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_y+1
	MOVLW      1
	MOVWF      FARG_Sm_Glcd_out2_x+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_x+1
	MOVLW      ?lstr2_RTSA_CW_2014+0
	MOVWF      FARG_Sm_Glcd_out2_txt+0
	CALL       _Sm_Glcd_out2+0
;RTSA_CW_2014.c,48 :: 		Sm_Glcd_Out2(37, 1, "ROM:");
	MOVLW      37
	MOVWF      FARG_Sm_Glcd_out2_y+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_y+1
	MOVLW      1
	MOVWF      FARG_Sm_Glcd_out2_x+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_x+1
	MOVLW      ?lstr3_RTSA_CW_2014+0
	MOVWF      FARG_Sm_Glcd_out2_txt+0
	CALL       _Sm_Glcd_out2+0
;RTSA_CW_2014.c,49 :: 		Sm_Glcd_Out2(0, 1, "MIN");
	CLRF       FARG_Sm_Glcd_out2_y+0
	CLRF       FARG_Sm_Glcd_out2_y+1
	MOVLW      1
	MOVWF      FARG_Sm_Glcd_out2_x+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_x+1
	MOVLW      ?lstr4_RTSA_CW_2014+0
	MOVWF      FARG_Sm_Glcd_out2_txt+0
	CALL       _Sm_Glcd_out2+0
;RTSA_CW_2014.c,50 :: 		Sm_Glcd_Out2(10, 1, "MAX");
	MOVLW      10
	MOVWF      FARG_Sm_Glcd_out2_y+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_y+1
	MOVLW      1
	MOVWF      FARG_Sm_Glcd_out2_x+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_x+1
	MOVLW      ?lstr5_RTSA_CW_2014+0
	MOVWF      FARG_Sm_Glcd_out2_txt+0
	CALL       _Sm_Glcd_out2+0
;RTSA_CW_2014.c,51 :: 		Sm_Glcd_Out2(20, 1, "MEAN");
	MOVLW      20
	MOVWF      FARG_Sm_Glcd_out2_y+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_y+1
	MOVLW      1
	MOVWF      FARG_Sm_Glcd_out2_x+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_x+1
	MOVLW      ?lstr6_RTSA_CW_2014+0
	MOVWF      FARG_Sm_Glcd_out2_txt+0
	CALL       _Sm_Glcd_out2+0
;RTSA_CW_2014.c,54 :: 		Glcd_H_Line(62, 126, 32, 1);
	MOVLW      62
	MOVWF      FARG_Glcd_H_Line_x_start+0
	MOVLW      126
	MOVWF      FARG_Glcd_H_Line_x_end+0
	MOVLW      32
	MOVWF      FARG_Glcd_H_Line_y_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_H_Line_color+0
	CALL       _Glcd_H_Line+0
;RTSA_CW_2014.c,55 :: 		Glcd_V_Line(0,32,62,1);
	CLRF       FARG_Glcd_V_Line_y_start+0
	MOVLW      32
	MOVWF      FARG_Glcd_V_Line_y_end+0
	MOVLW      62
	MOVWF      FARG_Glcd_V_Line_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_V_Line_color+0
	CALL       _Glcd_V_Line+0
;RTSA_CW_2014.c,57 :: 		ADCON1 = 0;
	CLRF       ADCON1+0
;RTSA_CW_2014.c,59 :: 		eepromval = getAn3(eepromloc);
	MOVF       main_eepromloc_L0+0, 0
	MOVWF      FARG_getAn3_eepromadrs+0
	CALL       _getAn3+0
	MOVF       R0+0, 0
	MOVWF      main_eepromval_L0+0
	MOVF       R0+1, 0
	MOVWF      main_eepromval_L0+1
;RTSA_CW_2014.c,60 :: 		showEepromval(eepromval,eeprommax);
	MOVF       R0+0, 0
	MOVWF      FARG_showEepromval_val+0
	MOVF       R0+1, 0
	MOVWF      FARG_showEepromval_val+1
	MOVF       main_eeprommax_L0+0, 0
	MOVWF      FARG_showEepromval_max+0
	MOVF       main_eeprommax_L0+1, 0
	MOVWF      FARG_showEepromval_max+1
	CALL       _showEepromval+0
;RTSA_CW_2014.c,61 :: 		an3now = ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_an3now_L0+0
	MOVF       R0+1, 0
	MOVWF      main_an3now_L0+1
;RTSA_CW_2014.c,62 :: 		intOut(26, 51, an3now);
	MOVLW      26
	MOVWF      FARG_intOut_x+0
	MOVLW      51
	MOVWF      FARG_intOut_y+0
	MOVF       R0+0, 0
	MOVWF      FARG_intOut_val+0
	MOVF       R0+1, 0
	MOVWF      FARG_intOut_val+1
	CALL       _intOut+0
;RTSA_CW_2014.c,64 :: 		while(1)
L_main0:
;RTSA_CW_2014.c,66 :: 		an3max = an3now;
	MOVF       main_an3now_L0+0, 0
	MOVWF      main_an3max_L0+0
	MOVF       main_an3now_L0+1, 0
	MOVWF      main_an3max_L0+1
;RTSA_CW_2014.c,67 :: 		eeprommax = eepromval;
	MOVF       main_eepromval_L0+0, 0
	MOVWF      main_eeprommax_L0+0
	MOVF       main_eepromval_L0+1, 0
	MOVWF      main_eeprommax_L0+1
;RTSA_CW_2014.c,68 :: 		an3now = ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_an3now_L0+0
	MOVF       R0+1, 0
	MOVWF      main_an3now_L0+1
;RTSA_CW_2014.c,70 :: 		key = scanKeypad();
	CALL       _scanKeypad+0
	MOVF       R0+0, 0
	MOVWF      main_key_L0+0
;RTSA_CW_2014.c,72 :: 		if(key == 1) //store an3 value
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;RTSA_CW_2014.c,74 :: 		storeAn3(eepromloc, an3now);
	MOVF       main_eepromloc_L0+0, 0
	MOVWF      FARG_storeAn3_eepromadrs+0
	MOVF       main_an3now_L0+0, 0
	MOVWF      FARG_storeAn3_val+0
	MOVF       main_an3now_L0+1, 0
	MOVWF      FARG_storeAn3_val+1
	CALL       _storeAn3+0
;RTSA_CW_2014.c,75 :: 		eepromval = an3now;
	MOVF       main_an3now_L0+0, 0
	MOVWF      main_eepromval_L0+0
	MOVF       main_an3now_L0+1, 0
	MOVWF      main_eepromval_L0+1
;RTSA_CW_2014.c,76 :: 		}
L_main2:
;RTSA_CW_2014.c,77 :: 		if(key == 2) //switch eeprom bank and return value
	MOVF       main_key_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;RTSA_CW_2014.c,79 :: 		if(eepromloc == 0) eepromloc = 16;
	MOVF       main_eepromloc_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	MOVLW      16
	MOVWF      main_eepromloc_L0+0
	GOTO       L_main5
L_main4:
;RTSA_CW_2014.c,80 :: 		else if(eepromloc == 16) eepromloc = 32;
	MOVF       main_eepromloc_L0+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_main6
	MOVLW      32
	MOVWF      main_eepromloc_L0+0
	GOTO       L_main7
L_main6:
;RTSA_CW_2014.c,81 :: 		else if(eepromloc == 32) eepromloc = 0;
	MOVF       main_eepromloc_L0+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_main8
	CLRF       main_eepromloc_L0+0
L_main8:
L_main7:
L_main5:
;RTSA_CW_2014.c,82 :: 		eepromval = getan3(eepromloc);
	MOVF       main_eepromloc_L0+0, 0
	MOVWF      FARG_getAn3_eepromadrs+0
	CALL       _getAn3+0
	MOVF       R0+0, 0
	MOVWF      main_eepromval_L0+0
	MOVF       R0+1, 0
	MOVWF      main_eepromval_L0+1
;RTSA_CW_2014.c,83 :: 		}
L_main3:
;RTSA_CW_2014.c,84 :: 		if(key == 4 && graphclear == 1) //run graph if it is clear
	MOVF       main_key_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main11
	MOVF       main_graphclear_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main11
L__main44:
;RTSA_CW_2014.c,86 :: 		graphclear = 0;
	CLRF       main_graphclear_L0+0
;RTSA_CW_2014.c,87 :: 		runGraph();
	CALL       _runGraph+0
;RTSA_CW_2014.c,88 :: 		}
L_main11:
;RTSA_CW_2014.c,89 :: 		if(key == 5 && graphclear == 0) //clear graph if it has been run
	MOVF       main_key_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	MOVF       main_graphclear_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main14
L__main43:
;RTSA_CW_2014.c,91 :: 		graphclear = 1;
	MOVLW      1
	MOVWF      main_graphclear_L0+0
;RTSA_CW_2014.c,92 :: 		resetGraph();
	CALL       _resetGraph+0
;RTSA_CW_2014.c,93 :: 		}
L_main14:
;RTSA_CW_2014.c,94 :: 		key = 0;
	CLRF       main_key_L0+0
;RTSA_CW_2014.c,96 :: 		if(an3now != an3max)
	MOVF       main_an3now_L0+1, 0
	XORWF      main_an3max_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       main_an3max_L0+0, 0
	XORWF      main_an3now_L0+0, 0
L__main46:
	BTFSC      STATUS+0, 2
	GOTO       L_main15
;RTSA_CW_2014.c,98 :: 		intOut(26, 51, an3now);
	MOVLW      26
	MOVWF      FARG_intOut_x+0
	MOVLW      51
	MOVWF      FARG_intOut_y+0
	MOVF       main_an3now_L0+0, 0
	MOVWF      FARG_intOut_val+0
	MOVF       main_an3now_L0+1, 0
	MOVWF      FARG_intOut_val+1
	CALL       _intOut+0
;RTSA_CW_2014.c,99 :: 		printBar(0, 59, an3now, an3max);
	CLRF       FARG_printBar_x+0
	MOVLW      59
	MOVWF      FARG_printBar_y+0
	MOVF       main_an3now_L0+0, 0
	MOVWF      FARG_printBar_val+0
	MOVF       main_an3now_L0+1, 0
	MOVWF      FARG_printBar_val+1
	MOVF       main_an3max_L0+0, 0
	MOVWF      FARG_printBar_max+0
	MOVF       main_an3max_L0+1, 0
	MOVWF      FARG_printBar_max+1
	CALL       _printBar+0
;RTSA_CW_2014.c,100 :: 		}
L_main15:
;RTSA_CW_2014.c,102 :: 		showEepromval(eepromval, eeprommax);
	MOVF       main_eepromval_L0+0, 0
	MOVWF      FARG_showEepromval_val+0
	MOVF       main_eepromval_L0+1, 0
	MOVWF      FARG_showEepromval_val+1
	MOVF       main_eeprommax_L0+0, 0
	MOVWF      FARG_showEepromval_max+0
	MOVF       main_eeprommax_L0+1, 0
	MOVWF      FARG_showEepromval_max+1
	CALL       _showEepromval+0
;RTSA_CW_2014.c,103 :: 		}
	GOTO       L_main0
;RTSA_CW_2014.c,104 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_intOut:

;RTSA_CW_2014.c,112 :: 		void intOut(char x, char y, int val)
;RTSA_CW_2014.c,116 :: 		IntToStr(val, out);
	MOVF       FARG_intOut_val+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       FARG_intOut_val+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      intOut_out_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;RTSA_CW_2014.c,117 :: 		Sm_Glcd_Out2(y, x, out);
	MOVF       FARG_intOut_y+0, 0
	MOVWF      FARG_Sm_Glcd_out2_y+0
	CLRF       FARG_Sm_Glcd_out2_y+1
	MOVF       FARG_intOut_x+0, 0
	MOVWF      FARG_Sm_Glcd_out2_x+0
	CLRF       FARG_Sm_Glcd_out2_x+1
	MOVLW      intOut_out_L0+0
	MOVWF      FARG_Sm_Glcd_out2_txt+0
	CALL       _Sm_Glcd_out2+0
;RTSA_CW_2014.c,118 :: 		}
L_end_intOut:
	RETURN
; end of _intOut

_printBar:

;RTSA_CW_2014.c,127 :: 		void printBar(char x, char y, int val, int max)
;RTSA_CW_2014.c,130 :: 		int trueval = val / 16;
	MOVLW      4
	MOVWF      R0+0
	MOVF       FARG_printBar_val+0, 0
	MOVWF      printBar_trueval_L0+0
	MOVF       FARG_printBar_val+1, 0
	MOVWF      printBar_trueval_L0+1
	MOVF       R0+0, 0
L__printBar49:
	BTFSC      STATUS+0, 2
	GOTO       L__printBar50
	RRF        printBar_trueval_L0+1, 1
	RRF        printBar_trueval_L0+0, 1
	BCF        printBar_trueval_L0+1, 7
	BTFSC      printBar_trueval_L0+1, 6
	BSF        printBar_trueval_L0+1, 7
	ADDLW      255
	GOTO       L__printBar49
L__printBar50:
;RTSA_CW_2014.c,132 :: 		for(i = 0; i<4; i++)
	CLRF       printBar_i_L0+0
L_printBar16:
	MOVLW      4
	SUBWF      printBar_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_printBar17
;RTSA_CW_2014.c,134 :: 		Glcd_H_Line(x, trueval, y+i, 1);
	MOVF       FARG_printBar_x+0, 0
	MOVWF      FARG_Glcd_H_Line_x_start+0
	MOVF       printBar_trueval_L0+0, 0
	MOVWF      FARG_Glcd_H_Line_x_end+0
	MOVF       printBar_i_L0+0, 0
	ADDWF      FARG_printBar_y+0, 0
	MOVWF      FARG_Glcd_H_Line_y_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_H_Line_color+0
	CALL       _Glcd_H_Line+0
;RTSA_CW_2014.c,132 :: 		for(i = 0; i<4; i++)
	INCF       printBar_i_L0+0, 1
;RTSA_CW_2014.c,135 :: 		}
	GOTO       L_printBar16
L_printBar17:
;RTSA_CW_2014.c,136 :: 		for(j = 0; j<4; j++)
	CLRF       printBar_j_L0+0
L_printBar19:
	MOVLW      4
	SUBWF      printBar_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_printBar20
;RTSA_CW_2014.c,138 :: 		Glcd_H_Line(trueval, 64, y+j, 0);
	MOVF       printBar_trueval_L0+0, 0
	MOVWF      FARG_Glcd_H_Line_x_start+0
	MOVLW      64
	MOVWF      FARG_Glcd_H_Line_x_end+0
	MOVF       printBar_j_L0+0, 0
	ADDWF      FARG_printBar_y+0, 0
	MOVWF      FARG_Glcd_H_Line_y_pos+0
	CLRF       FARG_Glcd_H_Line_color+0
	CALL       _Glcd_H_Line+0
;RTSA_CW_2014.c,136 :: 		for(j = 0; j<4; j++)
	INCF       printBar_j_L0+0, 1
;RTSA_CW_2014.c,139 :: 		}
	GOTO       L_printBar19
L_printBar20:
;RTSA_CW_2014.c,140 :: 		}
L_end_printBar:
	RETURN
; end of _printBar

_storeAn3:

;RTSA_CW_2014.c,149 :: 		void storeAn3(char eepromadrs, int val)
;RTSA_CW_2014.c,151 :: 		EEPROM_Write(eepromadrs, val & 0xFF);
	MOVF       FARG_storeAn3_eepromadrs+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      255
	ANDWF      FARG_storeAn3_val+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;RTSA_CW_2014.c,152 :: 		Delay_Ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_storeAn322:
	DECFSZ     R13+0, 1
	GOTO       L_storeAn322
	DECFSZ     R12+0, 1
	GOTO       L_storeAn322
	NOP
	NOP
;RTSA_CW_2014.c,153 :: 		EEPROM_Write(eepromadrs + 1, (val >> 8) & 0xFF);
	INCF       FARG_storeAn3_eepromadrs+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       FARG_storeAn3_val+1, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      FARG_storeAn3_val+1, 7
	MOVLW      255
	MOVWF      R0+1
	MOVLW      255
	ANDWF      R0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;RTSA_CW_2014.c,154 :: 		Delay_Ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_storeAn323:
	DECFSZ     R13+0, 1
	GOTO       L_storeAn323
	DECFSZ     R12+0, 1
	GOTO       L_storeAn323
	NOP
	NOP
;RTSA_CW_2014.c,155 :: 		}
L_end_storeAn3:
	RETURN
; end of _storeAn3

_getAn3:

;RTSA_CW_2014.c,165 :: 		int getAn3(char eepromadrs)
;RTSA_CW_2014.c,170 :: 		val1 = EEPROM_read(eepromadrs);
	MOVF       FARG_getAn3_eepromadrs+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      getAn3_val1_L0+0
	CLRF       getAn3_val1_L0+1
;RTSA_CW_2014.c,171 :: 		Delay_Ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_getAn324:
	DECFSZ     R13+0, 1
	GOTO       L_getAn324
	DECFSZ     R12+0, 1
	GOTO       L_getAn324
	NOP
	NOP
;RTSA_CW_2014.c,172 :: 		val2 = EEPROM_read(eepromadrs + 1);
	INCF       FARG_getAn3_eepromadrs+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      getAn3_val2_L0+0
	CLRF       getAn3_val2_L0+1
;RTSA_CW_2014.c,173 :: 		return ((val1 & 0xFF) + ((val2 << 8) & 0xFF00));
	MOVLW      255
	ANDWF      getAn3_val1_L0+0, 0
	MOVWF      R3+0
	MOVF       getAn3_val1_L0+1, 0
	MOVWF      R3+1
	MOVLW      0
	ANDWF      R3+1, 1
	MOVF       getAn3_val2_L0+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVLW      0
	ANDWF      R0+0, 1
	MOVLW      255
	ANDWF      R0+1, 1
	MOVF       R3+0, 0
	ADDWF      R0+0, 1
	MOVF       R3+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
;RTSA_CW_2014.c,174 :: 		}
L_end_getAn3:
	RETURN
; end of _getAn3

_showEepromval:

;RTSA_CW_2014.c,184 :: 		void showEepromval(int val, int max)
;RTSA_CW_2014.c,186 :: 		if(val == 0)
	MOVLW      0
	XORWF      FARG_showEepromval_val+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__showEepromval54
	MOVLW      0
	XORWF      FARG_showEepromval_val+0, 0
L__showEepromval54:
	BTFSS      STATUS+0, 2
	GOTO       L_showEepromval25
;RTSA_CW_2014.c,188 :: 		intOut(26,37,0);
	MOVLW      26
	MOVWF      FARG_intOut_x+0
	MOVLW      37
	MOVWF      FARG_intOut_y+0
	CLRF       FARG_intOut_val+0
	CLRF       FARG_intOut_val+1
	CALL       _intOut+0
;RTSA_CW_2014.c,189 :: 		}
L_showEepromval25:
;RTSA_CW_2014.c,190 :: 		if(val != max)
	MOVF       FARG_showEepromval_val+1, 0
	XORWF      FARG_showEepromval_max+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__showEepromval55
	MOVF       FARG_showEepromval_max+0, 0
	XORWF      FARG_showEepromval_val+0, 0
L__showEepromval55:
	BTFSC      STATUS+0, 2
	GOTO       L_showEepromval26
;RTSA_CW_2014.c,192 :: 		if(val == -1)
	MOVLW      255
	XORWF      FARG_showEepromval_val+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__showEepromval56
	MOVLW      255
	XORWF      FARG_showEepromval_val+0, 0
L__showEepromval56:
	BTFSS      STATUS+0, 2
	GOTO       L_showEepromval27
;RTSA_CW_2014.c,194 :: 		Sm_Glcd_Out2(37,38,"????");
	MOVLW      37
	MOVWF      FARG_Sm_Glcd_out2_y+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_y+1
	MOVLW      38
	MOVWF      FARG_Sm_Glcd_out2_x+0
	MOVLW      0
	MOVWF      FARG_Sm_Glcd_out2_x+1
	MOVLW      ?lstr7_RTSA_CW_2014+0
	MOVWF      FARG_Sm_Glcd_out2_txt+0
	CALL       _Sm_Glcd_out2+0
;RTSA_CW_2014.c,195 :: 		printBar(0, 46, 0, max);
	CLRF       FARG_printBar_x+0
	MOVLW      46
	MOVWF      FARG_printBar_y+0
	CLRF       FARG_printBar_val+0
	CLRF       FARG_printBar_val+1
	MOVF       FARG_showEepromval_max+0, 0
	MOVWF      FARG_printBar_max+0
	MOVF       FARG_showEepromval_max+1, 0
	MOVWF      FARG_printBar_max+1
	CALL       _printBar+0
;RTSA_CW_2014.c,196 :: 		}
	GOTO       L_showEepromval28
L_showEepromval27:
;RTSA_CW_2014.c,199 :: 		intOut(26,37,val);
	MOVLW      26
	MOVWF      FARG_intOut_x+0
	MOVLW      37
	MOVWF      FARG_intOut_y+0
	MOVF       FARG_showEepromval_val+0, 0
	MOVWF      FARG_intOut_val+0
	MOVF       FARG_showEepromval_val+1, 0
	MOVWF      FARG_intOut_val+1
	CALL       _intOut+0
;RTSA_CW_2014.c,200 :: 		printBar(0, 46, val, max);
	CLRF       FARG_printBar_x+0
	MOVLW      46
	MOVWF      FARG_printBar_y+0
	MOVF       FARG_showEepromval_val+0, 0
	MOVWF      FARG_printBar_val+0
	MOVF       FARG_showEepromval_val+1, 0
	MOVWF      FARG_printBar_val+1
	MOVF       FARG_showEepromval_max+0, 0
	MOVWF      FARG_printBar_max+0
	MOVF       FARG_showEepromval_max+1, 0
	MOVWF      FARG_printBar_max+1
	CALL       _printBar+0
;RTSA_CW_2014.c,201 :: 		}
L_showEepromval28:
;RTSA_CW_2014.c,202 :: 		}
L_showEepromval26:
;RTSA_CW_2014.c,203 :: 		}
L_end_showEepromval:
	RETURN
; end of _showEepromval

_runGraph:

;RTSA_CW_2014.c,210 :: 		void runGraph()
;RTSA_CW_2014.c,218 :: 		for(i = 0; i < 64; i++)
	CLRF       runGraph_i_L0+0
L_runGraph29:
	MOVLW      64
	SUBWF      runGraph_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_runGraph30
;RTSA_CW_2014.c,220 :: 		an3 = ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      runGraph_an3_L0+0
	MOVF       R0+1, 0
	MOVWF      runGraph_an3_L0+1
;RTSA_CW_2014.c,222 :: 		if(i==0)min = an3;
	MOVF       runGraph_i_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_runGraph32
	MOVF       runGraph_an3_L0+0, 0
	MOVWF      runGraph_min_L0+0
	MOVF       runGraph_an3_L0+1, 0
	MOVWF      runGraph_min_L0+1
L_runGraph32:
;RTSA_CW_2014.c,223 :: 		if(an3 > max)max = an3;
	MOVLW      128
	XORWF      runGraph_max_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      runGraph_an3_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__runGraph58
	MOVF       runGraph_an3_L0+0, 0
	SUBWF      runGraph_max_L0+0, 0
L__runGraph58:
	BTFSC      STATUS+0, 0
	GOTO       L_runGraph33
	MOVF       runGraph_an3_L0+0, 0
	MOVWF      runGraph_max_L0+0
	MOVF       runGraph_an3_L0+1, 0
	MOVWF      runGraph_max_L0+1
L_runGraph33:
;RTSA_CW_2014.c,224 :: 		if(an3 < min)min = an3;
	MOVLW      128
	XORWF      runGraph_an3_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      runGraph_min_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__runGraph59
	MOVF       runGraph_min_L0+0, 0
	SUBWF      runGraph_an3_L0+0, 0
L__runGraph59:
	BTFSC      STATUS+0, 0
	GOTO       L_runGraph34
	MOVF       runGraph_an3_L0+0, 0
	MOVWF      runGraph_min_L0+0
	MOVF       runGraph_an3_L0+1, 0
	MOVWF      runGraph_min_L0+1
L_runGraph34:
;RTSA_CW_2014.c,225 :: 		mean += an3;
	MOVF       runGraph_an3_L0+0, 0
	ADDWF      runGraph_mean_L0+0, 1
	MOVF       runGraph_an3_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      runGraph_mean_L0+1, 1
;RTSA_CW_2014.c,227 :: 		Glcd_V_Line(32,(32-(an3/32)),63+i,1);
	MOVLW      32
	MOVWF      FARG_Glcd_V_Line_y_start+0
	MOVLW      5
	MOVWF      R2+0
	MOVF       runGraph_an3_L0+0, 0
	MOVWF      R0+0
	MOVF       runGraph_an3_L0+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__runGraph60:
	BTFSC      STATUS+0, 2
	GOTO       L__runGraph61
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	ADDLW      255
	GOTO       L__runGraph60
L__runGraph61:
	MOVF       R0+0, 0
	SUBLW      32
	MOVWF      FARG_Glcd_V_Line_y_end+0
	MOVF       runGraph_i_L0+0, 0
	ADDLW      63
	MOVWF      FARG_Glcd_V_Line_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_V_Line_color+0
	CALL       _Glcd_V_Line+0
;RTSA_CW_2014.c,228 :: 		Delay_Ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_runGraph35:
	DECFSZ     R13+0, 1
	GOTO       L_runGraph35
	DECFSZ     R12+0, 1
	GOTO       L_runGraph35
	NOP
	NOP
;RTSA_CW_2014.c,218 :: 		for(i = 0; i < 64; i++)
	INCF       runGraph_i_L0+0, 1
;RTSA_CW_2014.c,229 :: 		}
	GOTO       L_runGraph29
L_runGraph30:
;RTSA_CW_2014.c,230 :: 		intOut(26, 0, min);
	MOVLW      26
	MOVWF      FARG_intOut_x+0
	CLRF       FARG_intOut_y+0
	MOVF       runGraph_min_L0+0, 0
	MOVWF      FARG_intOut_val+0
	MOVF       runGraph_min_L0+1, 0
	MOVWF      FARG_intOut_val+1
	CALL       _intOut+0
;RTSA_CW_2014.c,231 :: 		intOut(26, 10, max);
	MOVLW      26
	MOVWF      FARG_intOut_x+0
	MOVLW      10
	MOVWF      FARG_intOut_y+0
	MOVF       runGraph_max_L0+0, 0
	MOVWF      FARG_intOut_val+0
	MOVF       runGraph_max_L0+1, 0
	MOVWF      FARG_intOut_val+1
	CALL       _intOut+0
;RTSA_CW_2014.c,232 :: 		intOut(26, 20, mean = (mean/64));
	MOVLW      26
	MOVWF      FARG_intOut_x+0
	MOVLW      20
	MOVWF      FARG_intOut_y+0
	MOVLW      6
	MOVWF      R2+0
	MOVF       runGraph_mean_L0+0, 0
	MOVWF      R0+0
	MOVF       runGraph_mean_L0+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__runGraph62:
	BTFSC      STATUS+0, 2
	GOTO       L__runGraph63
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__runGraph62
L__runGraph63:
	MOVF       R0+0, 0
	MOVWF      runGraph_mean_L0+0
	MOVF       R0+1, 0
	MOVWF      runGraph_mean_L0+1
	MOVF       R0+0, 0
	MOVWF      FARG_intOut_val+0
	MOVF       R0+1, 0
	MOVWF      FARG_intOut_val+1
	CALL       _intOut+0
;RTSA_CW_2014.c,233 :: 		}
L_end_runGraph:
	RETURN
; end of _runGraph

_resetGraph:

;RTSA_CW_2014.c,239 :: 		void resetGraph()
;RTSA_CW_2014.c,243 :: 		for(i = 0; i<100; i++)
	CLRF       resetGraph_i_L0+0
L_resetGraph36:
	MOVLW      100
	SUBWF      resetGraph_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_resetGraph37
;RTSA_CW_2014.c,245 :: 		Glcd_V_Line(31,0,30+i,0);
	MOVLW      31
	MOVWF      FARG_Glcd_V_Line_y_start+0
	CLRF       FARG_Glcd_V_Line_y_end+0
	MOVF       resetGraph_i_L0+0, 0
	ADDLW      30
	MOVWF      FARG_Glcd_V_Line_x_pos+0
	CLRF       FARG_Glcd_V_Line_color+0
	CALL       _Glcd_V_Line+0
;RTSA_CW_2014.c,243 :: 		for(i = 0; i<100; i++)
	INCF       resetGraph_i_L0+0, 1
;RTSA_CW_2014.c,246 :: 		}
	GOTO       L_resetGraph36
L_resetGraph37:
;RTSA_CW_2014.c,247 :: 		Glcd_V_Line(0,32,62,1);
	CLRF       FARG_Glcd_V_Line_y_start+0
	MOVLW      32
	MOVWF      FARG_Glcd_V_Line_y_end+0
	MOVLW      62
	MOVWF      FARG_Glcd_V_Line_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_V_Line_color+0
	CALL       _Glcd_V_Line+0
;RTSA_CW_2014.c,248 :: 		}
L_end_resetGraph:
	RETURN
; end of _resetGraph

_scanKeypad:

;RTSA_CW_2014.c,256 :: 		int scanKeypad()
;RTSA_CW_2014.c,259 :: 		PORTC = 0b0100;
	MOVLW      4
	MOVWF      PORTC+0
;RTSA_CW_2014.c,260 :: 		TRISC = 0b0011;
	MOVLW      3
	MOVWF      TRISC+0
;RTSA_CW_2014.c,261 :: 		if(PORTC.RC0 == 1)key = 1;
	BTFSS      PORTC+0, 0
	GOTO       L_scanKeypad39
	MOVLW      1
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
L_scanKeypad39:
;RTSA_CW_2014.c,262 :: 		if(PORTC.RC1 == 1)key = 4;
	BTFSS      PORTC+0, 1
	GOTO       L_scanKeypad40
	MOVLW      4
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
L_scanKeypad40:
;RTSA_CW_2014.c,264 :: 		PORTC = 0b1000;
	MOVLW      8
	MOVWF      PORTC+0
;RTSA_CW_2014.c,265 :: 		if(PORTC.RC0 == 1)key = 2;
	BTFSS      PORTC+0, 0
	GOTO       L_scanKeypad41
	MOVLW      2
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
L_scanKeypad41:
;RTSA_CW_2014.c,266 :: 		if(PORTC.RC1 == 1)key = 5;
	BTFSS      PORTC+0, 1
	GOTO       L_scanKeypad42
	MOVLW      5
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
L_scanKeypad42:
;RTSA_CW_2014.c,267 :: 		return key;
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
;RTSA_CW_2014.c,268 :: 		}
L_end_scanKeypad:
	RETURN
; end of _scanKeypad
