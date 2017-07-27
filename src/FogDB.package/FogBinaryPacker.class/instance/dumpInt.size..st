required
dumpInt: anInteger size: aSize
	^ ((1 to: aSize) reverse collect: [ :i | anInteger digitAt: i ]) asByteArray