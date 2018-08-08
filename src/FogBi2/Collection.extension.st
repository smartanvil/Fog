Extension { #name : #Collection }

{ #category : #'*FogBi2' }
Collection >> asBlockCollection [
	^ FogBkArrayValue new
		name: 'Blocks';
		value: self;
		yourself
]

{ #category : #'*FogBi2' }
Collection >> asTxCollection [
	^ FogTxArrayValue new
		name: 'Transactions';
		value: self;
		yourself
]

{ #category : #'*FogBi2' }
Collection >> average [
	^ self size = 0
		ifTrue: [ 0 ]
		ifFalse: [ self sum / self size ]
]
