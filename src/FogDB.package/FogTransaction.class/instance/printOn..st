as yet unclassified
printOn: aStream
	^ ('{1} ${3}'
		format:
			{(from ifNotNil: [ from name ] ifNil: [ '[From:Null]' ]).
			(to ifNotNil: [ to name ] ifNil: [ '[To:Null]' ]).
			value asString.
			gas asString.
			gasPrice asString}) printOn: aStream