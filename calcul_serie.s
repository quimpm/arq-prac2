; calcul_serie

	.data
i:	.word 5		;iterador
uno:	.word 1		;número 1
dos:	.double 2	;número 2
tres:	.double 3	;número 3
num:	.double 1	;numerador
res:	.double	0	;resultat

	.text
	lw	R1,i(R0)	;R1 = 5
	l.d	F2,dos(R0)	;F2 = 2
	l.d	F3,tres(R0)	;F3 = 3
	l.d	F4,num(R0)	;F4 = 1
	l.d	F5,tres(R0)	;F5 = 3
	lw	R8,uno(R0)	;R8 = 1
BRANCH:
	mul.d	F4,F4,F2	;F4 = F4 * 2
	mul.d	F5,F5,F3	;F5 = F5 * 3
	div.d	F6,F4,F5	;F6 = F4 / F5
	add.d	F7,F7,F6	;F7 = F7 + F6 (F7 = res)
	dsub	R1,R1,R8	;R1 = R1 - 1
	bnez R1,BRANCH		;If R1 not 0, goto BRANCH
	s.d	F7,res(R0)	;Store result (F7) in Res
	halt