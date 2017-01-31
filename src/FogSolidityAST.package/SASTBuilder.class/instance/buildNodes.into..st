building methods
buildNodes: aCollectionOfNodes into: aContainingNode
	aCollectionOfNodes
		do: [ :n | 
			aContainingNode
				perform: ('add' , (n at: #name) , ':') asSymbol
				withArguments: {(self buildNode: n)} ].
	^ aContainingNode