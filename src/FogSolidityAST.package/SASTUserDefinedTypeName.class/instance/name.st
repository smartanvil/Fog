as yet unclassified
name
	^ referencesTo ifNil: [ name ] ifNotNil: [ referencesTo name ]