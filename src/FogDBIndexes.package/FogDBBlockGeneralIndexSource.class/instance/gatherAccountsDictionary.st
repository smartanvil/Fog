accounts-bitmap
gatherAccountsDictionary
	| dic accounts contracts |
	dic := Dictionary new.
	blocks
		do: [ :b | 
			(b isKindOf: FogDBNonInstalled)
				ifFalse: [ (b at: 5) , (b at: 6)
						inject: dic
						into: [ :d :each | 
							| collection |
							collection := dic at: each ifAbsentPut: [ OrderedCollection new ].
							collection add: (b at: 1).
							dic ] ] ].
	accounts := Dictionary new.
	contracts := Dictionary new.
	dic
		keysDo: [ :k | 
			[ | isContract hash |
			hash := k asBKHexa.
			hash size = 42
				ifTrue: [ isContract := (FogCachedConnection currentConnection eth getContractCode: k asBKHexa blockTag: #latest) isNotNil.
					isContract
						ifTrue: [ contracts at: hash put: (dic at: k) asSet asArray ]
						ifFalse: [ accounts at: hash put: (dic at: k) asSet asArray ] ] ] schedule ].
	^ {(#accounts -> accounts).
	(#contracts -> contracts)} asDictionary