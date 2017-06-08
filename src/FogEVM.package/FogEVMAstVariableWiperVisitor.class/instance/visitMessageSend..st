as yet unclassified
visitMessageSend: aFogEVMAstBinaryMessageSend
	aFogEVMAstBinaryMessageSend receiver accept: self.
	aFogEVMAstBinaryMessageSend arguments do: [ :a | a accept: self ]