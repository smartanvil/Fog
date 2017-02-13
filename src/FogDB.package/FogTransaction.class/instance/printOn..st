printing
printOn: aStream
	^ ('{1} -> {2} ${3}'
		format:
			{(from ifNotNil: [ from name ] ifNil: [ '[From:Null]' ]).
			(to ifNotNil: [ to name ] ifNil: [ '[To:Null]' ]).
			value asString}) printOn: aStream