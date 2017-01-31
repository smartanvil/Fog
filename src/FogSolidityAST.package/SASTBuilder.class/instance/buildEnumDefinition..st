build-node
buildEnumDefinition: aDictionaryNode
	| enum |
	enum := SASTEnum new.
	self buildNodes: (aDictionaryNode at: #children) into: enum.
	self setNodeValuesFrom: aDictionaryNode into: enum.
	types install: enum.
	types resolve:'uint8'.
	" "
	^ enum