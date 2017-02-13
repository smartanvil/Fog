as yet unclassified
inspect: anObject asTableInto: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: 'Properties';
		display: [ self propertiesToShowFrom: anObject ];
		children: [ :each | #() ];
		column: 'Name' evaluated: [ :each | each name ];
		column: 'Value' evaluated: [ :each | each ];
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