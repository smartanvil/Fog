as yet unclassified
convertToString
	^ name , ' -> ' , (GTObjectPrinter new asTruncatedTextFrom: self collectionBrief)