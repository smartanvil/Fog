as yet unclassified
assignToTemporaryVariable: aNode
	| var assignment |
	var := FogEVMAstVariable new.
	var createdAt: self currentInstruction. 
	self scope addTemporary: var.
	assignment := FogEVMAssignation new.
	assignment
		variable: var;
		value: aNode.
	self scope sequence addStatement: assignment.
	^ var