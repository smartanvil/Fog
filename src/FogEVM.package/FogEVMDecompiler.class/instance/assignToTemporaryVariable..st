as yet unclassified
assignToTemporaryVariable: aNode
	| var assignment |
	var := FogEVMAstVariable new.
	var createdAt: i.
	self currentScope addTemporary: var.
	assignment := FogEVMAssignation new.
	assignment
		variable: var;
		value: aNode.
	self currentScope sequence addStatement: assignment.
	^ var