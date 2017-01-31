as yet unclassified
loadCode: aFileReference
	| compiled | 
	compiled :=  FogUtils new compileSolidity: aFileReference .
	compiled fromFile: aFileReference.
	^ compiled. 