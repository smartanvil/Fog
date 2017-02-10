as yet unclassified
applyOn: anETHContractInstance valueWithArguments: aCollection configuration: aConfigurationDictionary
	^ modifiesState
		ifTrue: [ self
				resolveAsTransaction: anETHContractInstance
				valueWithArguments: aCollection
				configuration: aConfigurationDictionary ]
		ifFalse: [ self resolveAsCall: anETHContractInstance valueWithArguments: aCollection configuration: aConfigurationDictionary ]