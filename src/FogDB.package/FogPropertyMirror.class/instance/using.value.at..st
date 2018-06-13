accessing
using: aSession value: aContractAddress at: aBlockTagNumberOrHash
	^ layout
		using: aSession
		fetch: self
		from: aContractAddress
		at: aBlockTagNumberOrHash