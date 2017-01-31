accessing
convertToString
	^ name , ' -> ' , (GTObjectPrinter new asTruncatedTextFrom: value)