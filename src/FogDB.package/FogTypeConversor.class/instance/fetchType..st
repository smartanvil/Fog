as yet unclassified
fetchType: aTypeName
	^ self types
		at: (sastTypes resolve: aTypeName)
		ifAbsent: [ (sastTypes resolve: aTypeName) accept: self.
			self types at: (sastTypes resolve: aTypeName) ]