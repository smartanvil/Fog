"
Cache object has a dictionary that instantiate for each key a newCollection. Which depending on the caching set it is a real set or a fake set (that does not stores anything )
"
Class {
	#name : #FogCache,
	#superclass : #Object,
	#instVars : [
		'cache',
		'caching',
		'parent'
	],
	#classInstVars : [
		'current'
	],
	#category : 'FogLive-Cache'
}

{ #category : #accessing }
FogCache class >> current [
	^ current ifNil: [ current := self new ]
]

{ #category : #accessing }
FogCache class >> defaultIsCaching [
	^ true 
]

{ #category : #'instance creation' }
FogCache class >> newSessionCache [
	^ self current newSubCache: self new. 
]

{ #category : #accessing }
FogCache class >> reset [
	current := nil
]

{ #category : #'as yet unclassified' }
FogCache >> account [
	^ FogExternalAccount new
		address:  '0xb4ebf466889c4a0239379125a7d0f9c4e8bf2a14';
		name: 'Miner';
		yourself
]

{ #category : #'convenience-access' }
FogCache >> accounts [
	^ self cached: #accounts
]

{ #category : #'tree-cache' }
FogCache >> adoptCache: aCacheChild [
	aCacheChild resetWithParent: self.
	self registerCache: aCacheChild
	
]

{ #category : #'convenience-access' }
FogCache >> blocks [
	^ self cached: #blocks
]

{ #category : #accessing }
FogCache >> cached: aSymbol [
	^ (cache at: aSymbol ifAbsentPut: [ self newCollection ]) 
]

{ #category : #'convenience-access' }
FogCache >> caches [
	^ self cached: #caches
]

{ #category : #accessing }
FogCache >> caching [
	^ caching ifNil: [ caching := parent ifNil: [ self class defaultIsCaching ] ifNotNil: [ parent caching ] ]
]

{ #category : #'as yet unclassified' }
FogCache >> configuration [
	^ {(#from -> self account address).
	(#gas -> 3000000).
	(#gasPrice -> 60)}.
]

{ #category : #'convenience-access' }
FogCache >> contractBinds [
	^ self cached: #contractBinds
]

{ #category : #'convenience-access' }
FogCache >> contractDescriptions [
	^ self cached: #contractDescriptions
]

{ #category : #'convenience-access' }
FogCache >> contractInstances [
	^ self cached: #contractInstances
]

{ #category : #'convenience-access' }
FogCache >> contracts [
	^ self cached: #contracts
]

{ #category : #'cache management' }
FogCache >> detectAccount: aBlock ifNoneCreate: aBlockInitialized [
	^ self privateOnCacheCollection: #accounts detect: aBlock ifNoneCreate: aBlockInitialized
]

{ #category : #'cache management' }
FogCache >> detectBlocks: aBlock ifNoneCreate: aBlockInitialized [
	^ self privateOnCacheCollection: #blocks detect: aBlock ifNoneCreate: aBlockInitialized
]

{ #category : #'cache management' }
FogCache >> detectContractBind: aBlock ifNoneCreate: aBlockInitialized [
	^ self privateOnCacheCollection: #contractBinds detect: aBlock ifNoneCreate: aBlockInitialized
]

{ #category : #'cache management' }
FogCache >> detectTransactions: aBlock ifNoneCreate: aBlockInitialized [
	^ self privateOnCacheCollection: #transactions detect: aBlock ifNoneCreate: aBlockInitialized
]

{ #category : #initialization }
FogCache >> initialize [
	super initialize.
	cache := Dictionary new.
	
]

{ #category : #'instance creation' }
FogCache >> newCollection [
	^ self caching
		ifTrue: [ Dictionary new	"LRUCache new
				maximumWeight: 2000000;
				beThreadSafe;
				yourself" ]
		ifFalse: [ FogFakeSet new ]
]

{ #category : #'tree-cache' }
FogCache >> newSubCache: aSubCache [
	self adoptCache: aSubCache.
	^ aSubCache
]

{ #category : #private }
FogCache >> privateOnCacheCollection: aCacheTag detect: anAddress ifNoneCreate: aBlockInitialized [
	| collection |
	collection := self cached: aCacheTag.

	^ collection at: anAddress ifAbsent: [ self register: aBlockInitialized value into: aCacheTag ]
]

{ #category : #private }
FogCache >> privateWritableCache: aSymbol [
	^ (cache at: aSymbol ifAbsentPut: [ self newCollection ]) 
]

{ #category : #'convenience - register' }
FogCache >> register: anObject into: aCacheTag [
	^ (self privateWritableCache: aCacheTag) at: anObject privateAddress put: anObject
]

{ #category : #'convenience - register' }
FogCache >> registerAccount: anAccount [
	^ self register: anAccount into: #accounts
]

{ #category : #'convenience - register' }
FogCache >> registerBlock: aBlock [
	^ self register: aBlock into: #blocks
]

{ #category : #'convenience - register' }
FogCache >> registerContract: aContract [
	^ self register: aContract into: #contracts
]

{ #category : #'convenience - register' }
FogCache >> registerContractBind: aContractBind [
	^ self register: aContractBind into: #contractBinds
]

{ #category : #'convenience - register' }
FogCache >> registerContractDescription: aContractDescriptions [
	^ self register: aContractDescriptions into: #contractDescriptions
]

{ #category : #'convenience - register' }
FogCache >> registerContractInstance: aContractInstance [
	^ self register: aContractInstance into: #contractInstances
]

{ #category : #'convenience - register' }
FogCache >> registerTransaction: aTransaction [
	^ self register: aTransaction into: #transactions
]

{ #category : #initialization }
FogCache >> resetWithParent: aParent [
	self initialize.
	parent := aParent
]

{ #category : #private }
FogCache >> scanBlocks: aBlockCriteria ifNoneCreate: aBlockInitialized [
	| collection |
	collection := self cached: #blocks.
	^ collection values detect: aBlockCriteria ifNone: [ self register: aBlockInitialized value into: #blocks ]
]

{ #category : #private }
FogCache >> scanContractDescriptions: aBlockCriteria ifNoneCreate: aBlockInitialized [
	| collection |
	collection := self cached: #contractDescriptions.
	^ collection values detect:  aBlockCriteria ifNone: [ self register: aBlockInitialized value into: #contractDescriptions ]
]

{ #category : #'convenience-access' }
FogCache >> transactions [
	^ self cached: #transactions
]
