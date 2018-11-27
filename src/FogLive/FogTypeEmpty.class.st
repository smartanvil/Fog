"
This type reifies the absence of return 
"
Class {
	#name : #FogTypeEmpty,
	#superclass : #FogType,
	#category : 'FogDB-Meta-Types'
}

{ #category : #testing }
FogTypeEmpty >> isEmptyType [
	^ true
]

{ #category : #accessing }
FogTypeEmpty >> name [
	^ 'Empty'
]

{ #category : #testing }
FogTypeEmpty >> staticSlotSize [
	self error:'Does not apply to empty type'.
]

{ #category : #testing }
FogTypeEmpty >> unpack: aString using: aFogPacker [
	self error:'Does not apply to empty type'.
]
