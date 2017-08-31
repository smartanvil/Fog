as yet unclassified
gatherBlockNumbersForDatasource: aCollection 
	^ (left gatherBlockNumbersForDatasource: aCollection) intersection: (right gatherBlockNumbersForDatasource: aCollection)