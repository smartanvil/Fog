fetch - contract
decodeHTMLEscapeCharacters: aString
	"Decode common HTML escaped expression in the form of &xyz; to the actual character "

	| decoding |
	decoding := aString copyWithRegex: '&(gt|#62);' matchesReplacedWith: '>'.
	decoding := decoding copyWithRegex: '&(lt|#60);' matchesReplacedWith: '<'.
	decoding := decoding copyWithRegex: '&(amp|#38);' matchesReplacedWith: '&'.
	decoding := decoding copyWithRegex: '&(quot|#34);' matchesReplacedWith: '"'.
	decoding := decoding copyWithRegex: '&#39;' matchesReplacedWith: ''''.
	^ decoding