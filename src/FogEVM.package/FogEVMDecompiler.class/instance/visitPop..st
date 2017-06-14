visiting
visitPop: aFogVMPop
	"	| pop |
	pop := FogEVMAstPop new.
	pop variable: "

	stack pop
	"	self currentScope sequence addStatement: pop"