build - private
createTrait
	| trait |
	trait := Trait named: self buildTraitName uses: {} category: self buildCategoryName.
	self compilableInstanceMethods do: [ :c | trait compile: c classified: 'generated-mirror-based' ].
	self compilableClassMethods do: [ :c | trait classTrait compile: c classified: 'generated-mirror-based' ].
	^ trait