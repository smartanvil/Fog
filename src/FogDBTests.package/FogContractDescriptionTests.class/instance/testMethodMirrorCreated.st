initialization
testMethodMirrorCreated
	(descriptions flatCollect: [ :d | d mirror instanceMirror methods ]) allSatisfy: [ :d | d isKindOf: FogMethodMirror ]