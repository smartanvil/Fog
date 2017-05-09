build - private
createClassUsing: aFogContractTrait
	^ FogContractProxy
		subclass: self buildClassName asSymbol
		uses: aFogContractTrait
		slots: self buildInstanceSlots
		classVariables: self buildClassVariables
		category: self buildCategoryName.