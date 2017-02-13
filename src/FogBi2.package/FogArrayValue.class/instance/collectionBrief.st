as yet unclassified
collectionBrief
	^ value value ifEmpty: [ ' No items ' ] ifNotEmpty: [ '{1} item(s)' format: {value value size} ]