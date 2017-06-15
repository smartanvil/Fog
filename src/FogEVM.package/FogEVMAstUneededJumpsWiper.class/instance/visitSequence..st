visiting
visitSequence: aFogEVMSequence
	| previous toWipe |
	toWipe := OrderedCollection new.
	self visitAstNode: aFogEVMSequence.
	aFogEVMSequence statements ifEmpty: [ ^ self ].
	previous := aFogEVMSequence statements first.
	aFogEVMSequence statements
		do: [ :s | 
			(s isJumpDest
				and: [ previous isJump
						and: [ s address literalValue asBKNumber = previous address literalValue asBKNumber ] ])
				ifTrue: [ toWipe
						add: s;
						add: previous ].
			s ifNotNil: [ s accept: self ].
			previous := s ].
	toWipe do: [ :s | aFogEVMSequence removeStatement: s ]