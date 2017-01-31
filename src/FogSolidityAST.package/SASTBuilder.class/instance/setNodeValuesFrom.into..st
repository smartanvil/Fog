building methods
setNodeValuesFrom: aDictionaryNode into: aNode
	aNode
		id: (aDictionaryNode at: #id);
		src: (aDictionaryNode at: #src).
	(aDictionaryNode at: #attributes ifAbsent: [ Dictionary new ])
		associationsDo: [ :assc | self buildAndSetAttribute: assc for: aNode ].
	^ aNode