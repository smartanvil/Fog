as yet unclassified
using: aSession fetch: aMirrorProperty from: aContractAddress at: aBlockTagNumberOrHash
	^ aSession
		decode: (self using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash)
		type: aMirrorProperty type