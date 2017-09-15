as yet unclassified
fetchValue: aDataObject
	self haltIf: [value = #size ].
	^ aDataObject perform: value asSymbol