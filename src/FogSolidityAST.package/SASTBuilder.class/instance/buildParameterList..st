build-node
buildParameterList: aDictionaryNode
	| parameters |
	parameters := SASTParameterList new.
	self buildNodes: (aDictionaryNode at: #children) into: parameters.
	self setNodeValuesFrom: aDictionaryNode into: parameters.
	^ parameters