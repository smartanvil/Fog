accessing
using: aSession value: aContractInstance at: aBlockTagNumberOrHash
	^ layout
		using: aSession
		fetch: self
		from: aContractInstance
		at: aBlockTagNumberOrHash