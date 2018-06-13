as yet unclassified
using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount  amount: anAmount
	^ aSession
		deploy: aContractDescription
		applying: self
		arguments: aCollection
		from: anAccount
		amount: anAmount