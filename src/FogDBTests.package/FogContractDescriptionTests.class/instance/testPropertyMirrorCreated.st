initialization
testPropertyMirrorCreated
	(descriptions flatCollect: [ :d | d mirror instanceMirror properties ]) allSatisfy: [ :d | d isKindOf: FogPropertyMirror ]