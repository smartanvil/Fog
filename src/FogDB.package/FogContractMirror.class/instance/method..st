as yet unclassified
method: aString
	^ (aString beginsWith: #constructor)
		ifTrue: [ constructor ]
		ifFalse: [ self error: 'Constructor not founded' ]