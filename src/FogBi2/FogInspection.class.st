"
Just implements the logic for building up a FogValue based tabular inspector 
"
Class {
	#name : #FogInspection,
	#superclass : #Object,
	#category : 'FogBi2-Charting'
}

{ #category : #'as yet unclassified' }
FogInspection >> inspect: anObject asTableInto: composite [
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
]

{ #category : #'as yet unclassified' }
FogInspection >> propertiesToShowFrom: anObject [
	^ anObject bi2Properties select: #showInTable
]
