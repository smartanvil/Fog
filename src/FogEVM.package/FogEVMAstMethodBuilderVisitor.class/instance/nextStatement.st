as yet unclassified
nextStatement
	currentStatement := sequence statements at: nextNode.
	nextNode := nextNode + 1.
	^ currentStatement