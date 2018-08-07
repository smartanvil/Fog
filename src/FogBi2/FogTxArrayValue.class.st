"
Array of transactions 
"
Class {
	#name : #FogTxArrayValue,
	#superclass : #FogArrayValue,
	#category : 'FogBi2-Charting'
}

{ #category : #'as yet unclassified' }
FogTxArrayValue >> bi2Properties [
	^ value value
		collect: [ :b | 
			FogValue new
				name: 'Tx- ' , b transactionIndex asString;
				value: b;
				yourself ]
]

{ #category : #'as yet unclassified' }
FogTxArrayValue >> gtInspeactorBlockchainStats: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite roassal2
		title: 'Stats';
		initializeView: [ FogCharts new transactionsBasedMultiChart: value  value ]
]

{ #category : #'as yet unclassified' }
FogTxArrayValue >> gtTxInspection: composite [
	<gtInspectorPresentationOrder: 0>
	FogInspection new inspect: self asTableInto: composite
]

{ #category : #accessing }
FogTxArrayValue >> value [ 
	^ self
]
