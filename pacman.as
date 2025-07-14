;------------------------------------------------------------------------------
; ZONA I: Definicao de constantes
;         Pseudo-instrucao : EQU
;------------------------------------------------------------------------------

WRITE	        		EQU     FFFEh
INITIAL_SP      		EQU     FDFFh
CURSOR		    		EQU     FFFCh
CURSOR_INIT				EQU		FFFFh
FIM_TEXTO       		EQU     '@'
MAP_LINE_LENGTH			EQU		81d
MAP_NUMBER_LINE			EQU		24d
LINHA_INICIAL_PACMAN 	EQU 	10d
COLUNA_INICIAL_PACMAN 	EQU 	39d
TIMER_UNITS				EQU		FFF6h
ACTIVATE_TIMER			EQU		FFF7h
OFF						EQU		0d
ON						EQU		1d
NO_DIRECTION			EQU		0d
UP						EQU		1d
DOWN					EQU		2d
LEFT					EQU		3d
RIGHT					EQU		4d
BASE_ACSII				EQU 	48d

;-----------------------------------------------------------------------------------------------
; ZONA II: definicao de variaveis
;          Pseudo-instrucoes : WORD - palavra (16 bits)
;                              STR  - sequencia de caracteres (cada ocupa 1 palavra: 16 bits).
;          Cada caracter ocupa 1 palavra
;-----------------------------------------------------------------------------------------------
ORIG    8000h

L0	 STR '################################################################################', FIM_TEXTO
L1	 STR '##########............................................................##########', FIM_TEXTO
L2	 STR '...........#.#######.#########.####.##.##.##.####.#########.#######.#...........', FIM_TEXTO
L3	 STR '##.#######.#.#######.#########.####..........####.#########.#######.#.#######.##', FIM_TEXTO
L4	 STR '##..................................########..................................##', FIM_TEXTO
L5	 STR '##.#.#####.#.#######.#########.####..........####.#########.#######.#.#####.#.##', FIM_TEXTO
L6	 STR '##.#.#####.#.#######.#########.####.##.##.##.####.#########.#######.#.#####.#.##', FIM_TEXTO
L7	 STR '##...........X....................................................X...........##', FIM_TEXTO
L8	 STR '##.#######################.####.## ####  #### ##.####.#######################.##', FIM_TEXTO
L9	 STR '##............############.####.#              #.####.###########.............##', FIM_TEXTO
L10	 STR '#############...................#      C       #..................##############', FIM_TEXTO
L11	 STR '.........X....############.####.#              #.####.###########.....X.........', FIM_TEXTO
L12	 STR '#############.############.####.# #####  ##### #.####.###########.##############', FIM_TEXTO
L13	 STR '##............................................................................##', FIM_TEXTO
L14	 STR '##.#.########.############.##########.####.##########.###########.#########.#.##', FIM_TEXTO
L15	 STR '##.#.########.############.##########.####.##########.###########.#########.#.##', FIM_TEXTO
L16	 STR '##.#.######..........................................................######.#.##', FIM_TEXTO
L17	 STR '##.#.######.####################.#.##.####.##.#.####################.######.#.##', FIM_TEXTO
L18	 STR '##.#.######.####################.#.##.####.##.#.####################.######.#.##', FIM_TEXTO
L19	 STR '##.#.######.##########.................X..................##########.######.#.##', FIM_TEXTO
L20	 STR '.......................##################################.......................', FIM_TEXTO
L21	 STR '################################################################################', FIM_TEXTO
L22	 STR '## LIVES: <3 <3 <3 ##############################################  SCORE:000  ##', FIM_TEXTO
L23	 STR '################################################################################', FIM_TEXTO



L0W  STR '################################################################################', FIM_TEXTO
L1W  STR '################################################################################', FIM_TEXTO
L2W  STR '##                                                                            ##', FIM_TEXTO
L3W  STR '##                                                                            ##', FIM_TEXTO
L4W  STR '##                                                                            ##', FIM_TEXTO
L5W  STR '##                                                                            ##', FIM_TEXTO
L6W  STR '##      888     888 d8b          888                                888       ##', FIM_TEXTO
L7W  STR '##      888     888 Y8P          888                                888       ##', FIM_TEXTO
L8W  STR '##      888     888              888888                             888       ##', FIM_TEXTO
L9W  STR '##      88b     d88 888 .d8888b  888     .d88b.   888d888 888  888  888       ##', FIM_TEXTO
L10W STR '##      Y88b   d88P 888 d88P"    888    d88""88b 888P"    888  888  888       ##', FIM_TEXTO
L11W STR '##       Y88b d88P  888 888      888    888  888 888      888  888  888       ##', FIM_TEXTO
L12W STR '##        Y88o88P   888 888      888    888  888 888      888  888  Y8P       ##', FIM_TEXTO
L13W STR '##         Y888P    888 Y88b.    Y88b.  Y88..88P 888      Y88b 888   "        ##', FIM_TEXTO
L14W STR '##          Y8P     888  "Y8888P  "Y888  "Y88P"  888       "Y88888  888       ##', FIM_TEXTO
L15W STR '##                                                             888            ##', FIM_TEXTO
L16W STR '##                                                        Y8b d88P            ##', FIM_TEXTO
L17W STR '##                                                         "Y88P"             ##', FIM_TEXTO
L18W STR '##                                                                            ##', FIM_TEXTO
L19W STR '##                                                                            ##', FIM_TEXTO
L20W STR '##                                                                            ##', FIM_TEXTO
L21W STR '##                                                                            ##', FIM_TEXTO
L22W STR '################################################################################', FIM_TEXTO
L23W STR '################################################################################', FIM_TEXTO



L0L  STR '################################################################################', FIM_TEXTO
L1L  STR '################################################################################', FIM_TEXTO
L2L  STR '##                                                                            ##', FIM_TEXTO
L3L  STR '##          .d8888b.         d8888 888b     d888 888888888                    ##', FIM_TEXTO
L4L  STR '##         d88P  Y88b       d88888 8888b   d8888 888                          ##', FIM_TEXTO
L5L  STR '##         888    888      d88P888 88888b.d88888 888                          ##', FIM_TEXTO
L6L  STR '##         888            d88P 888 888Y88888P888 8888888                      ##', FIM_TEXTO
L7L  STR '##         888  88888    d88P  888 888 Y888P 888 888                          ##', FIM_TEXTO
L8L  STR '##         888    888   d88P   888 888  Y8P  888 888                          ##', FIM_TEXTO
L9L  STR '##         Y88b  d88P  d8888888888 888   "   888 888                          ##', FIM_TEXTO
L10L STR '##          "Y8888P88 d88P     888 888       888 888888888                    ##', FIM_TEXTO
L11L STR '##                                                                            ##', FIM_TEXTO
L12L STR '##                                                                            ##', FIM_TEXTO
L13L STR '##                   .d88888b.  888     888 8888888888 8888888b.  888         ##', FIM_TEXTO
L14L STR '##                  d88P" "Y88b 888     888 888        888   Y88b 888         ##', FIM_TEXTO
L15L STR '##                  888     888 888     888 888        888    888 888         ##', FIM_TEXTO
L16L STR '##                  888     888 Y88b   d88P 8888888    888   d88P 888         ##', FIM_TEXTO
L17L STR '##                  888     888  Y88b d88P  888        8888888P"  888         ##', FIM_TEXTO
L18L STR '##                  888     888   Y88o88P   888        888 T88b   Y8P         ##', FIM_TEXTO
L19L STR '##                  Y88b. .d88P    Y888P    888        888  T88b   "          ##', FIM_TEXTO
L20L STR '##                   "Y88888P"      Y8P     8888888888 888   T88b 888         ##', FIM_TEXTO
L21L STR '##                                                                            ##', FIM_TEXTO
L22L STR '################################################################################', FIM_TEXTO
L23L STR '################################################################################', FIM_TEXTO



TextIndex		 WORD	0d
LinhaPacman      WORD   LINHA_INICIAL_PACMAN
ColunaPacman     WORD   COLUNA_INICIAL_PACMAN
Pacman		 	 WORD	'C'
Apaga			 WORD	' '
Row_index		 WORD	0d
Column_index 	 WORD	0d              
TimerTest		 WORD	'a'
PacmanDirection	 WORD	NO_DIRECTION
Score			 WORD   0d
Lives_position   WORD	17d
Died			 WORD	0d
Ghost			 WORD	'X'
LinhaGhost0		 WORD	19d
ColunaGhost0	 WORD	39d
LinhaGhost1		 WORD	7d
ColunaGhost1	 WORD	13d
LinhaGhost2		 WORD	7d
ColunaGhost2	 WORD	66d
LinhaGhost3		 WORD	11d
ColunaGhost3	 WORD	9d
LinhaGhost4		 WORD	11d
ColunaGhost4	 WORD	70d
Ponto			 WORD   '.'


;------------------------------------------------------------------------------
; ZONA III: definicao de tabela de interrupções
;------------------------------------------------------------------------------

ORIG   	FE00h
INT0    WORD   	UpdatePacmanDirectionUp
INT1	WORD	UpdatePacmanDirectionDown
INT2	WORD	UpdatePacmanDirectionLeft
INT3	WORD	UpdatePacmanDirectionRight
ORIG   	FE0Fh
INT15	WORD	Timer

;------------------------------------------------------------------------------
; ZONA IV: codigo
;        conjunto de instrucoes Assembly, ordenadas de forma a realizar
;        as funcoes pretendidas
;------------------------------------------------------------------------------
                
ORIG    0000h
JMP     Main

;------------------------------------------------------------------------------
;Timer
;------------------------------------------------------------------------------

Timer:	PUSH R1

		MOV R1, M[PacmanDirection]
		CMP R1, NO_DIRECTION
		JMP.Z	EndTimer

		CMP R1, UP
		CALL.Z  PacmanUp

		CMP	R1, DOWN
		CALL.Z  PacmanDown

		CMP R1, LEFT
		CALL.Z PacmanLeft

		CMP R1, RIGHT
		CALL.Z PacmanRight

		MOV R3, M[ColunaGhost0]
	   	MOV R4, M[LinhaGhost0]
	   	CALL MoveGhost
	   	MOV M[ColunaGhost0], R3
	   	MOV M[LinhaGhost0], R4

		MOV R3, M[ColunaGhost1]
	   	MOV R4, M[LinhaGhost1]
	   	CALL MoveGhost
	   	MOV M[ColunaGhost1], R3
	   	MOV M[LinhaGhost1], R4

		MOV R3, M[ColunaGhost2]
	   	MOV R4, M[LinhaGhost2]
	   	CALL MoveGhost
	   	MOV M[ColunaGhost2], R3
	   	MOV M[LinhaGhost2], R4

		MOV R3, M[ColunaGhost3]
	   	MOV R4, M[LinhaGhost3]
	   	CALL MoveGhost
	   	MOV M[ColunaGhost3], R3
	   	MOV M[LinhaGhost3], R4

		MOV R3, M[ColunaGhost4]
	   	MOV R4, M[LinhaGhost4]
	   	CALL MoveGhost
	   	MOV M[ColunaGhost4], R3
	   	MOV M[LinhaGhost4], R4



EndTimer:	CALL TimerConfig
			POP R1
			RTI

TimerConfig:	PUSH R1

				MOV R1, 4d
				MOV M[TIMER_UNITS], R1
				MOV R1, ON
				MOV M[ACTIVATE_TIMER], R1

				POP R1
				RET

UpdatePacmanDirectionUp:	PUSH R1
							MOV R1, UP
							MOV M[PacmanDirection], R1
							POP R1
							RTI

UpdatePacmanDirectionDown:	PUSH R1
							MOV R1, DOWN
							MOV M[PacmanDirection], R1
							POP R1
							RTI


UpdatePacmanDirectionLeft:	PUSH R1
							MOV R1, LEFT
							MOV M[PacmanDirection], R1
							POP R1
							RTI


UpdatePacmanDirectionRight:	PUSH R1
							MOV R1, RIGHT
							MOV M[PacmanDirection], R1
							POP R1
							RTI



;------------------------------------------------------------------------------
;PRINT DA STRING
;------------------------------------------------------------------------------

PrintString:	PUSH R1	;Cursor
				PUSH R2	;Recebe caracter
				PUSH R3 ;Linha
				PUSH R4	;Coluna

				MOV	M[Column_index], R0
				MOV	M[TextIndex], R0

StringLoop:		MOV	R2, R1
				ADD	R2, M[TextIndex]							
				MOV	R2, M[R2]
				CMP	R2, FIM_TEXTO
				JMP.Z EndPrintString

				MOV	R4, M[Column_index] 
				MOV	R3, M[Row_index] 
				SHL	R3, 8d
				OR R3, R4

				MOV	M[CURSOR], R3
				MOV	M[WRITE], R2
				INC	M[TextIndex]
				INC	M[Column_index]
				JMP	StringLoop

EndPrintString:	MOV	M[Column_index], R0
				POP	R4
				POP	R3
			 	POP	R2
				POP	R1
				RET

;------------------------------------------------------------------------------
;PRINT MAPA
;------------------------------------------------------------------------------

PrintMap:	PUSH R1	
            PUSH R2
                               
MapLoop:    CALL PrintString        
            ADD R1, MAP_LINE_LENGTH
            INC M[Row_index]

            CMP R1, R2
            JMP.NP MapLoop	

EndPrintMap:	POP R2
                POP R1
                RET

;--------------------------------------------------------------------------------------
; Print Score
;--------------------------------------------------------------------------------------

PrintScore:	PUSH R1
			PUSH R2
			PUSH R3
			PUSH R4
			PUSH R5
			PUSH R6

			MOV R1, M[Score]
			MOV R2, 100
			MOV R3, 10
			DIV R1, R2		;R1 <- 654, R2 <- 100, APÓS DIVISÃO, R1 <- 6, R2, <- 54
			DIV R2, R3   	;R2 <- 54, R3 <- 10, APÓS DIVISÃO, R2 <- 5, R3, <- 4

			MOV R6, BASE_ACSII
			ADD R6, R1

			MOV R4, 22d
			MOV R5, 73d
			SHL R4, 8d
			OR R4, R5
			MOV M[CURSOR], R4
			MOV M[WRITE], R6



			MOV R6, BASE_ACSII
			ADD R6, R2

			MOV R4, 22d
			MOV R5, 74d
			SHL R4, 8d
			OR R4, R5
			MOV M[CURSOR], R4
			MOV M[WRITE], R6



			MOV R6, BASE_ACSII
			ADD R6, R3

			MOV R4, 22d
			MOV R5, 75d
			SHL R4, 8d
			OR R4, R5
			MOV M[CURSOR], R4
			MOV M[WRITE], R6

			MOV R6, 150
			MOV R5, M[Score]
			CMP R6, R5
			CALL.Z Win

			POP R6
			POP R5
			POP R4
			POP R3
			POP R2
			POP R1
			RET

;--------------------------------------------------------------------------------------
; Print Win
;--------------------------------------------------------------------------------------

Win:	PUSH R1
		PUSH R2
		PUSH R3

		MOV R1, 0
		MOV M[Row_index], R1

		MOV R1, L0W
		MOV R2, L23W
		CALL PrintMap

		MOV R1, OFF
		MOV M[ACTIVATE_TIMER], R1

		POP R2
		POP R1
		JMP	Halt
		RET

;--------------------------------------------------------------------------------------
;Perda de vida
;--------------------------------------------------------------------------------------			

Die: 	PUSH R1
		PUSH R2
		PUSH R3
		PUSH R4
		PUSH R5
		
		CALL ApagaPacman

		MOV R3, M[Apaga]
		MOV R1, 22d
		MOV R2, M[Lives_position]
		SHL R1, 8d
		OR R1, R2
		MOV M[CURSOR], R1
		MOV M[WRITE], R3

		DEC M[Lives_position]
		
		MOV R1, 22d
		MOV R2, M[Lives_position]
		SHL R1, 8d
		OR R1, R2
		MOV M[CURSOR], R1
		MOV M[WRITE], R3

		MOV R4, 2
		SUB M[Lives_position], R4

		INC M[Died]
		MOV R4, 3d
		CMP M[Died], R4
		CALL.Z GameOver
		
		MOV R4, LINHA_INICIAL_PACMAN
		MOV R3, COLUNA_INICIAL_PACMAN

		MOV M[LinhaPacman], R4
		MOV M[ColunaPacman], R3

		MOV R5, NO_DIRECTION
		MOV M[PacmanDirection], R5
		
		CALL PrintPacman

		POP R5
		POP R4 
		POP R3
		POP R2
		POP R1
		RET

;-------------------------------------------------------------------------------------
;Game Over
;--------------------------------------------------------------------------------------					

GameOver:		PUSH R1
				PUSH R2
				PUSH R3

				MOV R1, 0
				MOV M[Row_index], R1

				MOV R1, L0L
				MOV R2, L23L
				CALL PrintMap

				MOV R1, OFF
				MOV M[ACTIVATE_TIMER], R1

				POP R2
				POP R1
				JMP	Halt
				RET


;------------------------------------------------------------------------------
;PRINT PACAMAN
;------------------------------------------------------------------------------

PrintPacman:	PUSH R1				
				PUSH R2				
				PUSH R3							

				MOV R3, M[Pacman]
				MOV R1, M[LinhaPacman]
				MOV R2, M[ColunaPacman]

				SHL R1, 8d
				OR R1, R2
				MOV M[CURSOR], R1
				MOV M[WRITE], R3

				POP	R3
				POP R2
				POP R1
				RET

ApagaPacman:	PUSH R1				
				PUSH R2				
				PUSH R3				

				MOV R3, M[Apaga]
				MOV R1, M[LinhaPacman]
				MOV R2, M[ColunaPacman]

				SHL R1, 8d
				OR R1, R2
				MOV M[CURSOR], R1
				MOV M[WRITE], R3

				POP	R3
				POP R2
				POP R1
				RET
;--------------------------------------------------------------------------------------
; Apaga Fantasma
;--------------------------------------------------------------------------------------

;--------------------------------------------------------------------------------------
; Movimento Fantasma - Versão Final
;--------------------------------------------------------------------------------------
VerificaCol:   PUSH R3
			   PUSH R4
			   PUSH R5
			   PUSH R6

    		   MOV R5, R4
    		   MOV R6, 81d
    		   MUL R5, R6             ; R5 = nova_linha * 81
    		   ADD R6, R3             ; R6 = posição linear
    		   ADD R6, 8000h          ; endereço da posição na memória    
    		   MOV R6, M[R6]          ; caractere na posição
 
    		   MOV R5, '#'
    		   CMP R6, R5
			   
			   POP R6
			   POP R5
			   POP R4
			   POP R3
			   RET
			   

EndGhost: POP R7
		  POP R6
		  POP R5
		  POP R2
		  POP R1
		  RET

MoveGhostY: CALL GhostErase
    		ADD R4, R1
    		CALL GhostPrint
			CALL CheckGhostColision
			JMP EndGhost

MoveGhostX:   CALL GhostErase
    		  ADD R3, R6
    		  CALL GhostPrint
			  CALL CheckGhostColision
			  RET


CalcDist: PUSH R1
		  PUSH R2
		  PUSH R3
		  PUSH R4

		  MOV R1, M[ColunaPacman] ; Pacman no eixo x
		  MOV R2, M[LinhaPacman] ; Pacman no eixo y
		  ;R3 = fantasma no eixo x
		  ;R4 = fantasma no eixo y
		  
		  SUB R3, R1
		  SUB R4, R2

		  CMP R3, R0
		  CALL.N InverteX

		  CMP R4, R0
		  CALL.N InverteY
		  
		  ADD R3, R4 ;R3 é a distância
		  MOV R5, R3
		  
		  POP R4
		  POP R3
		  POP R2
		  POP R1
		  RET

InverteX: NEG R3
		 RET

InverteY: NEG R4
		 RET

MoveGhost:    PUSH R1
		   	  PUSH R2
		   	  PUSH R5
		   	  PUSH R6
		   	  PUSH R7

			  ;R3 - fantasma eixo x
			  ;R4 - fantasma eixo y

			  ;ele se move para cima
DistUp:	 	  PUSH R4
			  DEC R4
			  CALL VerificaCol
			  JMP.Z NoDistUp
			  CALL CalcDist
			  MOV R1, R5
		 	  POP  R4
			  JMP DistDown  

NoDistUp:	  MOV R1, 200d
			  POP  R4
			  ;ele se move para baixo
			  
DistDown:	  PUSH R4
			  INC R4
			  CALL VerificaCol
			  JMP.Z NoDistDown
			  CALL CalcDist
			  MOV R2, R5
			  POP R4
			  JMP DistRight
			  
NoDistDown: MOV R2, 200d
			POP  R4

			  ;Calcula a posição x

DistRight: 	  PUSH R3
			  INC R3
			  CALL VerificaCol
			  JMP.Z NoDistRight
			  CALL CalcDist
			  MOV R6, R5
			  POP R3
			  JMP DistLeft

NoDistRight:  MOV R6, 200d
			  POP  R3

DistLeft:     PUSH R3
			  DEC R3
			  CALL VerificaCol
			  JMP.Z NoDistLeft
			  CALL CalcDist
			  MOV R7, R5
			  POP R3
			  JMP TakeDecision

NoDistLeft:   MOV R7, 200d
			  POP  R3

			  ;ESCOLHE A MENOR DISTÂNCIA PARA TOMAR DECISÃO
TakeDecision: CMP R1, R2 
			  CALL.N UpCMP ;R1 MENOR, R3-=1
			  CALL.NN DownCMP ;R2 MENOR, R3+=1

			  CMP R6, R7 
			  CALL.N DirCMP ;R6 MENOR, R4+=1
			  CALL.NN LeftCMP ;R6 MENOR, R4-=1

			  CMP R2, R7
			  JMP.N MoveGhostY
			  CALL MoveGhostX
			  JMP EndGhost

UpCMP: MOV R2, R1
	MOV R1, -1
	RET

DownCMP: MOV R1, 1
	  RET

DirCMP: MOV R7, R6
	 MOV R6, 1
	 RET

LeftCMP:MOV R6, -1
	 RET



GhostErase: PUSH R1
			PUSH R3
			PUSH R4

			SHL R4, 8d
			OR  R4, R3
			MOV M[CURSOR], R4

			MOV R1, M[Ponto]
			MOV M[WRITE], R1
			 
			POP R4
			POP R3
			POP R1
			RET
			 
GhostPrint:  PUSH R1
			 PUSH R3
			 PUSH R4
			 SHL R4, 8d
			 OR  R4, R3
			 MOV M[CURSOR], R4

			 MOV R1, M[Ghost]
			 MOV M[WRITE], R1

			 POP R4
			 POP R3
			 POP R1
			 RET

CheckGhostColision:     PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4

    ; R3 = Coluna do fantasma
    ; R4 = Linha do fantasma
    ; Compare com Pacman
    MOV R1, M[ColunaPacman]
    MOV R2, M[LinhaPacman]

    CMP R1, R3
    JMP.NZ NoGhostHit
    CMP R2, R4
    JMP.NZ NoGhostHit

    CALL Die

NoGhostHit:    POP R4
    POP R3
    POP R2
    POP R1
    RET

;--------------------------------------------------------------------------------------
; Movimento Pacman
;--------------------------------------------------------------------------------------

PacmanUp:	PUSH R1
			PUSH R2
			PUSH R3
			PUSH R4
			JMP ColisaoUp	

ContinuaUp: CALL ApagaPacman
			MOV R1, M[LinhaPacman]
			DEC M[LinhaPacman]
			CALL PrintPacman
			JMP End

ColisaoUp:	MOV R1, M[ColunaPacman]
			MOV R2, M[LinhaPacman]
			DEC R2

			MOV R3, MAP_LINE_LENGTH
			MUL R3, R2
			ADD R2, R1
			ADD R2, 8000h

			MOV R1, M[R2]
			MOV R3, '#'
			CMP R1, R3
			JMP.Z End

			MOV R3, 'X'
			CMP R1, R3
			CALL.Z Die
			CMP R1, R3
			JMP.Z End

			MOV R3, '.'
			CMP R1, R3
			JMP.NZ NotScoreUp
			MOV R4, M[Apaga]
			MOV M[R2], R4
			CALL IncScore
	

NotScoreUp:	CALL PrintScore
			JMP ContinuaUp

PacmanDown:	PUSH R1
			PUSH R2
			PUSH R3
			PUSH R4
			JMP ColisaoDown

ContinuaDown:	CALL ApagaPacman
				INC M[LinhaPacman]
				CALL PrintPacman
				JMP End

ColisaoDown:	MOV R1, M[ColunaPacman]
				MOV R2, M[LinhaPacman]
				INC R2

				MOV R3, MAP_LINE_LENGTH
				MUL R3, R2
				ADD R2, R1
				ADD R2, 8000h

				MOV R1, M[R2]
				MOV R3, '#'
				CMP R1, R3
				JMP.Z End

				MOV R3, 'X'
				CMP R1, R3
				CALL.Z Die
				CMP R1, R3
				JMP.Z End

				MOV R3, '.'
				CMP R1, R3
				JMP.NZ NotScoreDown

				MOV R4, M[Apaga]
				MOV M[R2], R4

				CALL IncScore

NotScoreDown:	CALL PrintScore
				JMP ContinuaDown


PacmanLeft:		PUSH R1
				PUSH R2
				PUSH R3
				PUSH R4
				JMP ColisaoLeft

ContinuaLeft:	CALL ApagaPacman
				DEC M[ColunaPacman]
				CALL Portal
				CALL PrintPacman
				JMP End

ColisaoLeft:	MOV R1, M[ColunaPacman]
				MOV R2, M[LinhaPacman]
				DEC R1

				MOV R3, MAP_LINE_LENGTH
				MUL R3, R2
				ADD R2, R1
				ADD R2, 8000h

				MOV R1, M[R2]
				MOV R3, '#'
				CMP R1, R3
				JMP.Z End

				MOV R3, 'X'
				CMP R1, R3
				CALL.Z Die
				CMP R1, R3
				JMP.Z End

				MOV R3, '.'
				CMP R1, R3
				JMP.NZ NotScoreLeft

				MOV R4, M[Apaga]
				MOV M[R2], R4

				CALL IncScore

NotScoreLeft:	CALL PrintScore
				JMP ContinuaLeft

			
PacmanRight:	PUSH R1
				PUSH R2
				PUSH R3
				PUSH R4
				JMP ColisaoRight

ContinuaRight:	CALL ApagaPacman
				INC M[ColunaPacman]
				CALL Portal
				CALL PrintPacman
				JMP End

ColisaoRight:	MOV R1, M[ColunaPacman]
				MOV R2, M[LinhaPacman]
				INC R1

				MOV R3, MAP_LINE_LENGTH
				MUL R3, R2
				ADD R2, R1
				ADD R2, 8000h

				MOV R1, M[R2]
				MOV R3, '#'
				CMP R1, R3
				JMP.Z End

				MOV R3, 'X'
				CMP R1, R3
				CALL.Z Die
				CMP R1, R3
				JMP.Z End

				MOV R3, '.'
				CMP R1, R3 
				JMP.NZ NotScoreRight

				MOV R4, M[Apaga]
				MOV M[R2], R4
				
				CALL IncScore

NotScoreRight:	CALL PrintScore
				JMP ContinuaRight

IncScore:	PUSH R1
			MOV R1, M[Score]
			INC R1
			MOV M[Score], R1
			POP R1
			RET

End:		POP R4
			POP R3
			POP R2
			POP R1
			RET
;--------------------------------------------------------------------------------------
; Portais
;--------------------------------------------------------------------------------------

Portal:	PUSH R1

		MOV R1, M[ColunaPacman]
		CMP R1, -1d
		JMP.Z LeftPortal

		CMP R1, 80d
		JMP.Z RightPortal

		POP R1
		RET

LeftPortal:	MOV R1, 79d
			MOV M[ColunaPacman], R1
			POP R1
			RET

RightPortal:	MOV R1, 0d
				MOV M[ColunaPacman], R1
				POP R1
				RET
			




;--------------------------------------------------------------------------------------
; Main
;--------------------------------------------------------------------------------------

Main:	ENI
		MOV	R1, INITIAL_SP
		MOV	SP, R1		 			; We need to initialize the stack
		MOV	R1, CURSOR_INIT			; We need to initialize the cursor 
		MOV	M[CURSOR], R1			; with value CURSOR_INIT
	
		MOV R1, L0
		MOV R2, L23
		
		CALL PrintMap
		CALL PrintScore

		CALL TimerConfig

Cycle: 	JMP	Cycle	
Halt:   JMP	Halt	
