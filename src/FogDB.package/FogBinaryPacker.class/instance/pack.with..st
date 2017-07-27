required
pack: aCollection with: aCollectionOfTypeNames
	| pack |
	pack := OrderedCollection new.
	self assert: aCollection size = aCollectionOfTypeNames size.
	^ ((1 to: aCollection size)
		flatCollect:  [ :id | 
			| data typePacker |
			data := aCollection at: id.
			typePacker := ('pack' , (aCollectionOfTypeNames at: id) capitalized , ':') asSymbol.
			self perform: typePacker withArguments: {data} ]) asByteArray