visiting
visitAssignation: aFogEVMAssignation
	(aFogEVMAssignation value = aFogEVMAssignation variable or: [ aFogEVMAssignation variable isEVMVariable not ])
		ifTrue: [ currentScope sequence removeStatement: aFogEVMAssignation ]
		ifFalse: [ state := #writing.
			assignationValue := aFogEVMAssignation value.
			aFogEVMAssignation variable accept: self.
			state := #reading.
			aFogEVMAssignation value accept: self ]