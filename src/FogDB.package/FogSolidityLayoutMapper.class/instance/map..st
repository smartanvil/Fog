accessing structure variables
map: aMirror
	| property slotFrom byteFrom slotTo byteTo SLOT_SIZE slotCount byteCount toSetIntoProperty set |
	set := aMirror properties.
	
	SLOT_SIZE := 32. 
	slotCount := byteCount := byteFrom := byteTo := slotTo := slotFrom := 0. 
	1 to: set size do: [ :idx | 
		| sizeToCover sizeSlotRelation currentStructMapping collectedMappings |
		
		currentStructMapping := nil.
		property := set at: idx.
		"Structs starts at fresh slots"
		property type isStruct ifTrue: [ 
			byteCount = 0 ifFalse:[
				slotCount := slotCount + 1.
				byteCount := 0.	
			].
			currentStructMapping := FogSolidityStructLayoutMapping new.
			currentStructMapping fromSlot: slotCount byte: byteCount.
		].
		collectedMappings := property type collect: [ :type |  
		sizeToCover := type staticSlotSize. 
		
		slotFrom := slotCount.
		byteFrom := byteCount.

		sizeSlotRelation :=  sizeToCover - (SLOT_SIZE - byteCount).
		"The slot is just enogh for storing the data"
		sizeSlotRelation = 0 ifTrue: [ 
			slotTo := slotCount.
			byteTo := SLOT_SIZE -1. " Is based in 0 index convention (hate it)"
			slotCount := slotCount + 1.
			byteCount := 0.		
			sizeToCover := 0
		] ifFalse: [ 
				"The slot is far enough for storing the data"
			sizeSlotRelation < 0 ifTrue: [
				slotTo := slotCount.
				byteTo := byteCount + sizeToCover -1. 
				byteCount := byteCount + sizeToCover.
				sizeToCover := 0.
				"The slot is not big enough for storing the data"
			 ] ifFalse: [ 
			 	slotCount := slotCount + 1.
				slotFrom := slotCount.
				byteCount := sizeToCover.
				slotTo := slotCount.
				byteFrom := 0.
				byteTo := sizeToCover - 1.
			 ]
		].
			
		   FogSolidityLayoutMapping new 
				fromSlot: slotFrom byte: byteFrom; 
				toSlot: slotTo byte: byteTo; 
				yourself. 
	
		].
		
		currentStructMapping ifNil: [ 
			self assert: collectedMappings size = 1.
			toSetIntoProperty := collectedMappings at: 1.   
		] ifNotNil: [ 
			currentStructMapping addAll: collectedMappings.
			currentStructMapping toSlot: slotCount byte: byteCount - 1.
			
			toSetIntoProperty := currentStructMapping.
			"After a struct, there is a fresh new slot."
			byteCount = 0 ifFalse:[
				slotCount := slotCount + 1.
				byteCount := 0.	
			].
		].
		property layout: toSetIntoProperty.
	].





