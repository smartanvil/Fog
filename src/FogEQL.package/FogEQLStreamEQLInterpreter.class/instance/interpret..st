private
interpret: aScript
	^ (EQLExpressionParser parseStream: aScript readStream) acceptVisitor: self.
