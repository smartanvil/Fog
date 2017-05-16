tree-cache
adoptCache: aCacheChild
	aCacheChild resetWithParent: self.
	self registerCache: aCacheChild
	