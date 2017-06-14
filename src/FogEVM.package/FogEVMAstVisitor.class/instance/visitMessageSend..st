visiting
visitMessageSend: aFogEVMAstBinaryMessageSend
	self visitAstNode: aFogEVMAstBinaryMessageSend.
	aFogEVMAstBinaryMessageSend receiver accept: self.
	aFogEVMAstBinaryMessageSend arguments do: [ :a | a accept: self ]