visiting
visitLimitStatement: anEQLLimitStatementNode
	^ FogEQLLimit new
		limit: anEQLLimitStatementNode amount value asNumber;
		yourself