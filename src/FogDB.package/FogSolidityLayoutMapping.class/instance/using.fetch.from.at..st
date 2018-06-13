as yet unclassified
using: aSession fetch: aMirrorProperty from: aContractInstanceBind at: aBlockTagNumberOrHash
	^ aSession
		decode: (self using: aSession fetchContentsFrom: aContractInstanceBind at: aBlockTagNumberOrHash)
		type: aMirrorProperty type