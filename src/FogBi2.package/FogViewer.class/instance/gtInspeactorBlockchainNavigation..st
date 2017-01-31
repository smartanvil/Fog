gtextention
gtInspeactorBlockchainNavigation: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: 'Block';
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