tests
testSessionFetchAccount
	| account |
	account := session account: #'0x3f8b33142f20121e523738e814ff0a1162c0d577'.
	self assertIsASessionProxy: account.
	self assert: account isKindOf: FogExternalAccount