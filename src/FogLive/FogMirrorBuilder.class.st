"
Mirror builder has the responsibility of poutting together all the needed bricks-steps for building up a new mirror 
"
Class {
	#name : #FogMirrorBuilder,
	#superclass : #Object,
	#instVars : [
		'ast',
		'abi'
	],
	#category : 'FogDB-Meta-Mirror'
}

{ #category : #accessing }
FogMirrorBuilder >> abi: anABI [
	abi := anABI
]

{ #category : #accessing }
FogMirrorBuilder >> ast: anAST [
	ast := anAST
]

{ #category : #accessing }
FogMirrorBuilder >> memoryMapper [
	^ FogSolidityLayoutMapper new
]

{ #category : #accessing }
FogMirrorBuilder >> mirror [
	| builder mirror |
	mirror := FogContractMirror new.
	ast
		ifNotNil: [ builder := self propertiesBuilder.
			ast acceptVisitor: builder.
			builder buildInto: mirror.
			self memoryMapper map: mirror instanceMirror ].
	^ mirror
]

{ #category : #accessing }
FogMirrorBuilder >> propertiesBuilder [
	^ FogMirrorSmaccASTBasedBuilder new
]
