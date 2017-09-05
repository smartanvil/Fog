as yet unclassified
resultstream
	^resultstream ifNil: [ 
		resultstream := (filter createResultStreamFor: source) . 
	 ]