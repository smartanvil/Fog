tests
testContractViewerOnSimpleStorageValuesAreTheExpected
	| mirror |
	mirror := simpleStorage contract mirror instanceMirror.

	self
		assert:
			(mirror
				using: session
				property: #_owner
				on: simpleStorage
				at: #latest) value
		equals: self ownerAccountAddress.
	self
		assert:
			(mirror
				using: session
				property: #test2
				on: simpleStorage
				at: #latest) value
		equals: true.
	self
		assert:
			(mirror
				using: session
				property: #storedData
				on: simpleStorage
				at: #latest) value
		equals: 2