as yet unclassified
json
	| dictionary |
	dictionary := (mirror properties collect: [ :p | p name -> (p value: instance)  ]) asDictionary.
	dictionary at: #contract put: instance contract asString.
	^ NeoJSONWriter toString: dictionary