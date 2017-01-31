as yet unclassified
applyOn: anETHContractInstance valueWithArguments: aCollection sender: anAccount
	^ self isStateModifier
		ifTrue: [ self resolveAsTransaction: anETHContractInstance valueWithArguments: aCollection sender: anAccount]
		ifFalse: [ self resolveAsCall: anETHContractInstance valueWithArguments: aCollection sender: anAccount]