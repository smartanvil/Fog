"
This trait adds some GTTools capabilities 
"
Trait {
	#name : #TFogShowable,
	#category : 'FogBi2-Charting'
}

{ #category : #gtextention }
TFogShowable >> gtInspeactorBlockchainNavigation: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: 'Properties';
		display: [ self propertiesToShowInTable];
		children: [ :each | #() ];
		column: 'Name' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each name ];
		column: 'Value' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each convertToString ];
		beMultiple;
		withSmalltalkSearch;
		send: [ :selection | 
			selection isNil
				ifTrue: [ nil ]
				ifFalse: [ selection size = 1
						ifTrue: [ selection anyOne value ]
						ifFalse: [ selection collect: #value ] ] ];
		showOnly: 50;
		helpMessage: 'Quick selection field. Given your INPUT, it executes: self select: [:each | INPUT ]'
]

{ #category : #gtextention }
TFogShowable >> propertiesToShowInTable [
	^ self showableProperties select: #showInTable
]

{ #category : #gtextention }
TFogShowable >> propertiesToShowRoassalBlock [
	^ self showableProperties select: #showInRoassalBlock
]

{ #category : #required }
TFogShowable >> showableProperties [
	^ self required 
]
