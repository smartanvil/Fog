as yet unclassified
configure: aSetOfTypes
	sastTypes := aSetOfTypes.
	aSetOfTypes types do: [ :t | t accept: self ]