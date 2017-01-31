as yet unclassified
for: aHash
	FogCache current accounts
		detect: [ :a | a privateAccountHash = aHash asAddress ]
		ifFound: [ :a | ^ a ]
		ifNone: [  ].
	^ self cachedNew
		hash: aHash;
		name: 'Unknown account';
		yourself