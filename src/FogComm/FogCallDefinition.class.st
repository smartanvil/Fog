"
This is a complex transfer entity for the case of the call and sendtransaction methods.  
"
Class {
	#name : #FogCallDefinition,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'gas',
		'gasPrice',
		'value',
		'data',
		'nounce'
	],
	#category : 'FogCommunication-Transfer-Call'
}

{ #category : #'as yet unclassified' }
FogCallDefinition class >> neoJsonMapping: mapper [
	mapper
		for: self
		do: [ :mapping | 
			mapping
				mapAccessor: #from;
				mapAccessor: #to;
				mapAccessor: #hexaValue to: #value;
				mapAccessor: #hexaGas to: #gas;
				mapAccessor: #hexaGasPrice to: #gasPrice;
				mapAccessor: #hexaValue to: #value;
				mapAccessor: #data;
				mapAccessor: #hexaNounce to: #nounce ]
]

{ #category : #accessing }
FogCallDefinition >> data [
	^ data
]

{ #category : #accessing }
FogCallDefinition >> data: anObject [
	data := anObject
]

{ #category : #accessing }
FogCallDefinition >> from [
	^ from
]

{ #category : #accessing }
FogCallDefinition >> from: anObject [
	from := anObject
]

{ #category : #accessing }
FogCallDefinition >> gas [
	^ gas
]

{ #category : #accessing }
FogCallDefinition >> gas: anObject [
	gas := anObject
]

{ #category : #'as yet unclassified' }
FogCallDefinition >> gas: amount priced: price [
	self
		gas: amount;
		gasPrice: price
]

{ #category : #accessing }
FogCallDefinition >> gasPrice [
	^ gasPrice
]

{ #category : #accessing }
FogCallDefinition >> gasPrice: anObject [
	gasPrice := anObject
]

{ #category : #accessing }
FogCallDefinition >> hexaGas [
	^ gas asBKHexa
]

{ #category : #accessing }
FogCallDefinition >> hexaGasPrice [
	^ gasPrice asBKHexa
]

{ #category : #accessing }
FogCallDefinition >> hexaNounce [
	^ nounce asBKHexa
]

{ #category : #accessing }
FogCallDefinition >> hexaValue [
	^ value asBKHexa
]

{ #category : #actions }
FogCallDefinition >> load: aConfigurationDictionary [
	aConfigurationDictionary asDictionary
		keysAndValuesDo: [ :k :v | self perform: (k , ':') asSymbol withArguments: {v} ]
]

{ #category : #accessing }
FogCallDefinition >> nounce [
	^ nounce
]

{ #category : #accessing }
FogCallDefinition >> nounce: anObject [
	nounce := anObject
]

{ #category : #accessing }
FogCallDefinition >> to [
	^ to
]

{ #category : #accessing }
FogCallDefinition >> to: anObject [
	to := anObject
]

{ #category : #accessing }
FogCallDefinition >> value [
	^ value
]

{ #category : #accessing }
FogCallDefinition >> value: anObject [
	value := anObject
]
