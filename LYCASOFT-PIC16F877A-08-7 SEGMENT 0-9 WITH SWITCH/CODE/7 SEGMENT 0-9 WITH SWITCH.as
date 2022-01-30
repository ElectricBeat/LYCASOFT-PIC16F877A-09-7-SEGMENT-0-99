opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 4 "D:\SRIDHAR\02-LYCASOFT EMBEDDED CODING\02-PIC 16F877A CODING\08-7 SEGMENT 0-9 WITH SWITCH\CODE\7 SEGMENT 0-9 WITH SWITCH.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "D:\SRIDHAR\02-LYCASOFT EMBEDDED CODING\02-PIC 16F877A CODING\08-7 SEGMENT 0-9 WITH SWITCH\CODE\7 SEGMENT 0-9 WITH SWITCH.c"
	dw 0X3F3A ;#
	FNROOT	_main
	global	_DIG
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	file	"D:\SRIDHAR\02-LYCASOFT EMBEDDED CODING\02-PIC 16F877A CODING\08-7 SEGMENT 0-9 WITH SWITCH\CODE\7 SEGMENT 0-9 WITH SWITCH.c"
	line	8

;initializer for _DIG
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	0FFh
	retlw	067h
	global	_Count
	global	_PORTB
_PORTB	set	6
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RB7
_RB7	set	55
	global	_TRISB
_TRISB	set	134
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"7 SEGMENT 0-9 WITH SWITCH.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_Count:
       ds      2

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"D:\SRIDHAR\02-LYCASOFT EMBEDDED CODING\02-PIC 16F877A CODING\08-7 SEGMENT 0-9 WITH SWITCH\CODE\7 SEGMENT 0-9 WITH SWITCH.c"
_DIG:
       ds      10

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
	fcall	__pidataCOMMON+1		;fetch initializer
	movwf	__pdataCOMMON+1&07fh		
	fcall	__pidataCOMMON+2		;fetch initializer
	movwf	__pdataCOMMON+2&07fh		
	fcall	__pidataCOMMON+3		;fetch initializer
	movwf	__pdataCOMMON+3&07fh		
	fcall	__pidataCOMMON+4		;fetch initializer
	movwf	__pdataCOMMON+4&07fh		
	fcall	__pidataCOMMON+5		;fetch initializer
	movwf	__pdataCOMMON+5&07fh		
	fcall	__pidataCOMMON+6		;fetch initializer
	movwf	__pdataCOMMON+6&07fh		
	fcall	__pidataCOMMON+7		;fetch initializer
	movwf	__pdataCOMMON+7&07fh		
	fcall	__pidataCOMMON+8		;fetch initializer
	movwf	__pdataCOMMON+8&07fh		
	fcall	__pidataCOMMON+9		;fetch initializer
	movwf	__pdataCOMMON+9&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
;;Data sizes: Strings 0, constant 0, data 10, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      0      12
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0       C      12        0.0%
;;ABS                  0      0       C       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       0       2        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      0       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 14 in file "D:\SRIDHAR\02-LYCASOFT EMBEDDED CODING\02-PIC 16F877A CODING\08-7 SEGMENT 0-9 WITH SWITCH\CODE\7 SEGMENT 0-9 WITH SWITCH.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\SRIDHAR\02-LYCASOFT EMBEDDED CODING\02-PIC 16F877A CODING\08-7 SEGMENT 0-9 WITH SWITCH\CODE\7 SEGMENT 0-9 WITH SWITCH.c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	15
	
l1746:	
;7 SEGMENT 0-9 WITH SWITCH.c: 15: TRISB=0X80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	16
	
l1748:	
;7 SEGMENT 0-9 WITH SWITCH.c: 16: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	goto	l690
	line	18
;7 SEGMENT 0-9 WITH SWITCH.c: 18: while(1)
	
l689:	
	line	20
;7 SEGMENT 0-9 WITH SWITCH.c: 19: {
;7 SEGMENT 0-9 WITH SWITCH.c: 20: while(RB7==1)
	goto	l690
	
l691:	
	line	22
	
l1750:	
;7 SEGMENT 0-9 WITH SWITCH.c: 21: {
;7 SEGMENT 0-9 WITH SWITCH.c: 22: PORTB=DIG[Count];
	movf	(_Count),w
	addlw	_DIG&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(6)	;volatile
	line	23
	
l1752:	
;7 SEGMENT 0-9 WITH SWITCH.c: 23: Count++;
	movlw	low(01h)
	addwf	(_Count),f
	skipnc
	incf	(_Count+1),f
	movlw	high(01h)
	addwf	(_Count+1),f
	line	24
	
l1754:	
;7 SEGMENT 0-9 WITH SWITCH.c: 24: if(Count>=10)
	movf	(_Count+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u15
	movlw	low(0Ah)
	subwf	(_Count),w
u15:

	skipc
	goto	u11
	goto	u10
u11:
	goto	l693
u10:
	line	26
	
l1756:	
;7 SEGMENT 0-9 WITH SWITCH.c: 25: {
;7 SEGMENT 0-9 WITH SWITCH.c: 26: Count=0;
	clrf	(_Count)
	clrf	(_Count+1)
	goto	l693
	line	27
	
l692:	
	line	28
;7 SEGMENT 0-9 WITH SWITCH.c: 27: }
;7 SEGMENT 0-9 WITH SWITCH.c: 28: while(RB7==1);
	goto	l693
	
l694:	
	
l693:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7
	goto	u21
	goto	u20
u21:
	goto	l693
u20:
	goto	l690
	
l695:	
	line	29
	
l690:	
	line	20
	btfsc	(55/8),(55)&7
	goto	u31
	goto	u30
u31:
	goto	l1750
u30:
	goto	l690
	
l696:	
	goto	l690
	line	30
	
l697:	
	line	18
	goto	l690
	
l698:	
	line	31
	
l699:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
