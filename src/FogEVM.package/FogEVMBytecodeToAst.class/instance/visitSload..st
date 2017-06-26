visiting
visitSload: aFogVMSload
	| storageLoadNode from var |
	storageLoadNode := FogEVMAstStorageLoad new.
	from := self literalOrVariable: stack pop.
	storageLoadNode address: from.
	var := self assignToTemporaryVariable: storageLoadNode.
	stack push: var