build-node
buildFunctionCall: aDictionaryNode
	| fcall children function arguments |
	fcall := SASTFunctionCall new.
	children := aDictionaryNode at: #children.
	self assert: children size > 1.
	function := self buildNode: children first.
	arguments := self buildNodes: children allButFirst.
	fcall function: function.
	fcall arguments: arguments.
	self setNodeValuesFrom: aDictionaryNode into: function.
	^ fcall