as yet unclassified
visitSstore: aFogVMSstore
	| sStoreNode |
	sStoreNode := FogEVMAstStorageStore new.
	sStoreNode address: (self literalOrVariable: stack pop).
	sStoreNode value: (self literalOrVariable: stack pop).
	self scope sequence addStatement: sStoreNode