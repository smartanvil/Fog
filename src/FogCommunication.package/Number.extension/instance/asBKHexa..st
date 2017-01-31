*FogCommunication
asBKHexa: aLength
	^ (self hex asString copyReplaceAll: '16r' with: '') asLowercase
		padLeftTo: aLength
		with: $0