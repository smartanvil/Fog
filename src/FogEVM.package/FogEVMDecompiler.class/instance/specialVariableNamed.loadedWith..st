as yet unclassified
specialVariableNamed: aName loadedWith: aNode
	| variable |
	variable := self currentScope temporaries
		detect: [ :t | t name = aName ]
		ifNone: [ | var assign |
			var := FogEVMAstVariable new.
			var createdAt: i.
			var name: aName.
			assign := FogEVMAssignation new.
			assign variable: var.
			assign value: aNode.
			self currentScope addTemporary: var.
			self currentScope sequence addStatement: assign.
			var ].
	^ variable