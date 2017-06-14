as yet unclassified
wipe
	(readWriteTracker associations
		select: [ :a | a key isGenerated and: [ (a value at: #read) = 1 and: [ (a value at: #write) = 1 ] ] ])
		do: [ :a | a key becomeForward: (a value at: #lastAssignment) ].
	(readWriteTracker associations
		select: [ :a | 
			a key isEVMVariable
				and: [ a key isGenerated and: [ (a value at: #read) = 0 and: [ (a value at: #write) > 1 ] ] ] ])
		do: [ :a | a key name: 'NON-READ-' , a key name ].
	(readWriteTracker associations
		select: [ :a | 
			a key isEVMVariable
				and: [ a key isGenerated and: [ (a value at: #read) > 1 and: [ (a value at: #write) = 1 ] ] ] ])
		do: [ :a | 
			(a value at: #lastAssignment) isEVMLiteral
				ifTrue: [ a key becomeForward: (a value at: #lastAssignment) ]
				ifFalse: [ a key value: (a value at: #lastAssignment).
					a key constant: true ] ]