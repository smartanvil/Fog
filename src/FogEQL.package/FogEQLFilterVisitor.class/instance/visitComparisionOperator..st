as yet unclassified
visitComparisionOperator: aFogEQLGreaterOperator
	^ '{1} {2} {3}'
		format:
			{(aFogEQLGreaterOperator left acceptVisitor: self).
			aFogEQLGreaterOperator operation.
			(aFogEQLGreaterOperator right acceptVisitor: self)}