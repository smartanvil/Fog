build-node
buildIndexAccess: aDictionaryNode
	| indexAccess children |
	indexAccess := SASTIndexAccess new.
	children := aDictionaryNode at: #children.
	self assert: children size = 2.
	indexAccess indexable: (self buildNode: children first).
	indexAccess index: (self buildNode: children second).
	self setNodeValuesFrom: aDictionaryNode into: indexAccess.
	^ indexAccess