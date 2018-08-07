Extension { #name : #FogContractDescription }

{ #category : #'*FogEVM' }
FogContractDescription >> mnemonicBinary [
	^ FogEVMByteCode fromBinary: binary
]

{ #category : #'*FogEVM' }
FogContractDescription >> mnemonicRuntime [
	^ runtime ifNotNil: [ FogEVMByteCode fromBinary: runtime ]
]
