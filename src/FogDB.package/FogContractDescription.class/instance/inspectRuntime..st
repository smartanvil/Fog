gttools
inspectRuntime: composite
	<gtInspectorPresentationOrder: 7>
	(self respondsTo: #mnemonicRuntime)
		ifTrue: [ self mnemonicRuntime
				ifNotNil: [ :mnem | self inspect: mnem content on: composite title: 'Runtime Mnemonic' ] ]
		ifFalse: [ composite text
				title: 'Runtime bytecode';
				display: [ self runtime ] ]