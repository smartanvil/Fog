build - private
createClassUsing: aFogContractTrait
	| class |
	class := FogContractProxy
		subclass: self buildClassName asSymbol
		uses: aFogContractTrait
		slots: self buildInstanceSlots
		classVariables: self buildClassVariables
		category: self buildCategoryName.
	class comment: self buildClassComment.
	^ class