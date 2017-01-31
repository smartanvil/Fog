*FogCommunication
asBKNumber
	| converting |
	converting := (self beginsWith: '16r')
		ifTrue: [ self copyReplaceAll: '0x' with: '16r' ]
		ifFalse: [ (self beginsWith: '0x')
				ifTrue: [ self ]
				ifFalse: [ '16r' , self ] ].
	^ converting asNumber