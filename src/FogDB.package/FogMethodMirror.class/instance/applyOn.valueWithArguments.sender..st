as yet unclassified
applyOn: anETHContractInstance valueWithArguments: aCollection sender: anAccount
	| configuration |
	configuration := {(#from -> anAccount address).
	(#to -> anETHContractInstance address).
	(#gas -> 300000).
	(#gasPrice -> 60)}.
	^ modifiesState
		ifTrue: [ self resolveAsTransaction: anETHContractInstance valueWithArguments: aCollection configuration: configuration ]
		ifFalse: [ self resolveAsCall: anETHContractInstance valueWithArguments: aCollection configuration: configuration ]