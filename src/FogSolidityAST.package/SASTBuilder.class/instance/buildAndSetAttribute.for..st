as yet unclassified
buildAndSetAttribute: anAssociation for: aNode
	| block |
	block := [ | value |
	value := self
		perform: ('buildAttribute' , anAssociation key capitalized , ':for:') asSymbol
		withArguments:
			{anAssociation value.
			aNode}.
	aNode perform: (anAssociation key , ':') asSymbol withArguments: {value} ].
	block
		on: SASTChainForceDeferredTypeResolution
		do: [ self registerPostReduction: block ].
	^ aNode