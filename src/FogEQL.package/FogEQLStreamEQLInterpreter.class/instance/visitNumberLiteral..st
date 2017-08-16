as yet unclassified
visitNumberLiteral: anEQLNumberLiteralNode
	^ (anEQLNumberLiteralNode unit acceptVisitor: self) asFogUnit
		amount: (anEQLNumberLiteralNode number acceptVisitor: self) asNumber