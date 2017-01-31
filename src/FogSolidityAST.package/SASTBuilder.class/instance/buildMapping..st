build-node
buildMapping: aDictionaryNode
	| map children |
	map := SASTMapping new.
	children := aDictionaryNode at: #children.
	self assert: children size = 2.
	self setNodeValuesFrom: aDictionaryNode into: map.
	self
		registerPostReduction: [ map keyType: (types resolve: (self buildNode: children first) name).
			map valueType: (types resolve: (self buildNode: children second) name).
			types install: map ].
	^ map