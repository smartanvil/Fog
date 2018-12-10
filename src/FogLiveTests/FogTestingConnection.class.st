Class {
	#name : #FogTestingConnection,
	#superclass : #FogConnection,
	#category : #'FogLiveTests-BridgeToEVM'
}

{ #category : #'rpc call' }
FogTestingConnection >> call: aFogMessage [
	^ service processMessage: aFogMessage
]

{ #category : #'rpc call' }
FogTestingConnection >> initialize [
	super initialize.
	service := FogEVMRPCService new.

]
