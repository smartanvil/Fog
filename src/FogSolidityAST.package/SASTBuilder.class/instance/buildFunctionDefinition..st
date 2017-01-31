build-node
buildFunctionDefinition: aDictionaryNode
	| function children parameters return block |
	function := SASTFunction new.
	children := aDictionaryNode at: #children.
	self assert: children size = 3.
	parameters := self buildNode: children first.
	return := self buildNode: children second.
	block := self buildNode: children third.
	function
		parameters: parameters;
		return: return;
		block: block.
	self setNodeValuesFrom: aDictionaryNode into: function.
	self
		registerPostReduction: [ 
			function type: (types getOrCreateFunctionTypeFor: function).
		].
	^ function