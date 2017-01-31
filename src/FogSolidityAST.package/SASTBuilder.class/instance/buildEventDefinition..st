build-node
buildEventDefinition: aDictionaryNode
	| event children |
	event := SASTEvent new.
	children := aDictionaryNode at: #children.
	self assert: children size = 1.
	event parameters: (self buildNode: children first).
	self setNodeValuesFrom: aDictionaryNode into: event.
	self
		registerPostReduction: [ 
			event type: (types getOrCreateFunctionTypeFor: event).
		].
	^ event