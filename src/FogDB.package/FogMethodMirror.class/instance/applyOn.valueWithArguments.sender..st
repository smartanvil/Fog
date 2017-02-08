as yet unclassified
applyOn: anETHContractInstance valueWithArguments: aCollection sender: anAccount
	^ modifiesState
		ifTrue:
			[ self resolveAsTransaction: anETHContractInstance valueWithArguments: aCollection sender: anAccount ]
		ifFalse: [ self resolveAsCall: anETHContractInstance valueWithArguments: aCollection sender: anAccount ]