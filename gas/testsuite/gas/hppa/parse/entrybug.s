	.SPACE $PRIVATE$
	.SUBSPA $DATA$,QUAD=1,ALIGN=8,ACCESS=31
	.SUBSPA $BSS$,QUAD=1,ALIGN=8,ACCESS=31,ZERO,SORT=82
	.SPACE $TEXT$
	.SUBSPA $LIT$,QUAD=0,ALIGN=8,ACCESS=44
	.SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY
	.IMPORT $global$,DATA
	.IMPORT $$dyncall,MILLICODE
; gcc_compiled.:
	.SPACE $TEXT$
	.SUBSPA $CODE$

	.align 4
	.PARAM foo,RTNVAL=GR
foo:
	.PROC
	.CALLINFO FRAME=128,NO_CALLS,ENTRY_GR=1,ENTRY_FR=11
	.ENTRY
	bv,n %r0(%r2)
	.EXIT
	.PROCEND
	.SPACE $TEXT$
	.SUBSPA $LIT$

