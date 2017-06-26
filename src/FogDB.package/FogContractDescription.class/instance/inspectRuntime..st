gttools
inspectRuntime: composite
	<gtInspectorPresentationOrder: 7>
	
	(self respondsTo: #mnemonicRuntime)
		ifTrue: [ self inspect: self mnemonicRuntime content on: composite title: 'Runtime Mnemonic' ]
		ifFalse: [ composite text
				title: 'Runtime bytecode';
				display: [ self runtime ] ]