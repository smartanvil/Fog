gttools
inspectDecompilation: composite
	<gtInspectorPresentationOrder: 8>
	composite text
		title: 'Runtime Decompilation';
		display: [ | decompiler stream |
			decompiler := FogEVMDecompiler new.
			FogEVMAstVariable initialize.
			decompiler decompile: self mnemonicRuntime.
			stream := '' writeStream.
			decompiler extractedMethods do: [ :m | m printOn: stream ].
			stream contents ]