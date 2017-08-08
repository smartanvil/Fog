accessing
content
	| prev content |
	prev := currentBlockNumber.
	currentBlockNumber := fromBlockNumber.
	content := self next: toBlockNumber - fromBlockNumber.
	currentBlockNumber := prev.
	^ content