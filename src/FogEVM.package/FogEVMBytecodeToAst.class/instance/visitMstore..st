visiting
visitMstore: aFogVMMstore
	| memoryStoreNode |
	memoryStoreNode := FogEVMAstMemoryStore new.
	memoryStoreNode address: stack pop.
	memoryStoreNode value: stack pop.
	self scope sequence addStatement: memoryStoreNode