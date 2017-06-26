gttools
inspectBinary: composite
	<gtInspectorPresentationOrder: 6>
	(self respondsTo: #mnemonicBinary)
		ifTrue: [ self inspect: self mnemonicBinary content on: composite title: 'Binary Mnemonic' ]
		ifFalse: [ composite text
				title: 'Binary bytecode';
				display: [ self binary ] ]