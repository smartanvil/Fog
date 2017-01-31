as yet unclassified
relatedContracts
	^ relatedContracts
		ifNil: [ relatedContracts := (self transactions
				inject: Set new
				into: [ :ac :t | 
					ac
						add: t from;
						add: t to;
						yourself ])
				collect: [ :a | self connection admin getContractInfo: a ] ]