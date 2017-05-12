as yet unclassified
getContractCode: aContractAddress blockTag: aBlockTag
	| code |
	code := self send: (api messageGetCode: aContractAddress blockTag: aBlockTag).
	^ code = '0x'
		ifTrue: [ nil ]
		ifFalse: [ code ]