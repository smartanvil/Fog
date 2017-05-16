convenience - register
registerCache: aFogSessionCache
	^ (self privateWritableCache: #cache) add: aFogSessionCache