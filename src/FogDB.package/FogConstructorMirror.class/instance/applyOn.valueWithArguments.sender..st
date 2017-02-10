as yet unclassified
applyOn: aContractDescription valueWithArguments: aCollection sender: anAccount
	| configuration |
	configuration := {(#from -> anAccount address).
	(#gas -> 3000000).
	(#gasPrice -> 60)}.
	^ self applyOn: aContractDescription valueWithArguments: aCollection configuration: configuration