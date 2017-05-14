initialization
testMirrorInstanceCreated
	descriptions allSatisfy: [ :d | d mirror instanceMirror isKindOf: FogContractInstanceMirror ]