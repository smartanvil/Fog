as yet unclassified
specialVariableNamed: aName loadedWith: aNode
	| variable |
	variable := self scope temporaries
		detect: [ :t | t name = aName ]
		ifNone: [ | var assign |
			var := FogEVMAstVariable new.
			var createdAt: self currentInstruction.
			var name: aName.
			assign := FogEVMAssignation new.
			assign variable: var.
			assign value: aNode.
			self scope addTemporary: var.
			self scope sequence addStatement: assign.
			var ].
	^ variable