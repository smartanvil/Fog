private
buildSemanticTree: aScript
	^ (EQLExpressionParser parseStream: aScript readStream) acceptVisitor: self.
