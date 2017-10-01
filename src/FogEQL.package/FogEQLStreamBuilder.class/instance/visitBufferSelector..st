as yet unclassified
visitBufferSelector: aFogEQLBufferSelector
	^ aFogEQLBufferSelector binding -> (environment getBufferNamed: aFogEQLBufferSelector selector)