as yet unclassified
visitExpressionList: anEQLExpressionListNode
	^ anEQLExpressionListNode exps collect: [ :e | e acceptVisitor: self ]