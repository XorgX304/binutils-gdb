	.SPACE $PRIVATE$
	.SUBSPA $DATA$,QUAD=1,ALIGN=8,ACCESS=31
	.SUBSPA $BSS$,QUAD=1,ALIGN=8,ACCESS=31,ZERO,SORT=82
	.SPACE $TEXT$
	.SUBSPA $LIT$,QUAD=0,ALIGN=8,ACCESS=44
	.SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY
	.IMPORT $global$,DATA
	.IMPORT $$dyncall,MILLICODE
; gcc_compiled.:
	.IMPORT bar,CODE
	.SPACE $TEXT$
	.SUBSPA $CODE$

	.align 4
	.EXPORT foo,CODE
	.EXPORT foo,ENTRY,PRIV_LEV=3,RTNVAL=GR
foo
	.PROC
	.CALLINFO FRAME=64,CALLS,SAVE_RP
	.ENTRY
	stw %r2,-20(%r30)
	.CALL 
	bl bar,%r2
	ldo 64(%r30),%r30
	.blockz 262144
	ldw -84(%r30),%r2
	bv %r0(%r2)
	ldo -64(%r30),%r30
	.EXIT
	.PROCEND
	.align 4
	.EXPORT bar,CODE
	.EXPORT bar,ENTRY,PRIV_LEV=3,RTNVAL=GR
bar
	.PROC
	.CALLINFO FRAME=0,NO_CALLS
	.ENTRY
	bv,n %r0(%r2)
	.EXIT
	.PROCEND
