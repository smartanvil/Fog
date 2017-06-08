visiting
visitMstore: aFogVMMstore
	| memoryStoreNode |
	memoryStoreNode := FogEVMAstMemoryStore new.
	memoryStoreNode address: stack pop.
	memoryStoreNode value: stack pop.
	self currentScope sequence addStatement: memoryStoreNode