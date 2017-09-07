as yet unclassified
visitNumberLiteral: anEQLNumberLiteralNode
	| number |
	number := (anEQLNumberLiteralNode number acceptVisitor: self) asNumber.
	^ anEQLNumberLiteralNode unit
		ifNil: [ number ]
		ifNotNil: [ (anEQLNumberLiteralNode unit acceptVisitor: self) asFogUnit amount: number ]