printing
printOn: aStream
	"	aStream nextPutAll: 'L('."

	aStream
		nextPutAll:
			((value beginsWith: '0x')
				ifTrue: [ value copyReplaceAll: '0x' with: '16r' ]
				ifFalse: [ value ])
	"	aStream nextPutAll: ')'"