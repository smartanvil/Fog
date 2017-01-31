as yet unclassified
pack: aCollection withTypes: typeCollection
	| result |
	self assert: aCollection size = typeCollection size.
	result := ''.
	aCollection
		with: typeCollection
		do: [ :data :type | result := result , (type pack: data using: self) ].
	^ result