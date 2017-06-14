visiting
visitStop: aReturn
	(lookUpTable at: currentMethodAnalysis) at: #endNode put: aReturn