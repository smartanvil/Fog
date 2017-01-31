as yet unclassified
collectionBrief
	| avgGas avgPrice avgValue |
	^ value size > 0
		ifTrue: [ avgGas := (value collect: #gas) average.
			avgPrice := (value collect: #gasPrice) average.
			avgValue := (value collect: #value) average.
			'{1} transaction(s) AVG gas:{2} AVG gas-price:{3} AVG ether:{4}'
				format:
					{value size.
					avgGas asInteger.
					avgPrice asInteger.
					avgValue asInteger} ]
		ifFalse: [ ' No transactions ' ]