"
Array of blocks 
"
Class {
	#name : #FogBkArrayValue,
	#superclass : #FogArrayValue,
	#category : 'FogBi2-Charting'
}

{ #category : #'as yet unclassified' }
FogBkArrayValue >> bi2Properties [
	^ value value
		collect: [ :b | 
			FogValue new 
				name: b number;
				value: b;
				yourself ]
]

{ #category : #'as yet unclassified' }
FogBkArrayValue >> gtBlockInspection: composite [
	<gtInspectorPresentationOrder: 0>
	FogInspection new inspect: self asTableInto: composite
]

{ #category : #'as yet unclassified' }
FogBkArrayValue >> gtInspeactorBlockchainStats: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite roassal2
		title: 'Stats';
		initializeView: [ FogCharts new blockBasedMultiChart: value value ]
]

{ #category : #'as yet unclassified' }
FogBkArrayValue >> gtInspeactorBlockchainTxStats: composite [
"	<gtInspectorPresentationOrder: 0>"
	^ composite roassal2
		title: 'Stats Tx ';
		initializeView: [ FogCharts new transactionsBasedMultiChart: (value flatCollect: #transactions) ]
]
