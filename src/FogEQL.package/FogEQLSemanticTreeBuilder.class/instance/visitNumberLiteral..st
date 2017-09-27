as yet unclassified
visitNumberLiteral: anEQLNumberLiteralNode
	^ (anEQLNumberLiteralNode value acceptVisitor: self) asNumber