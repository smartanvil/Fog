*FogCommunication
asBKHexa
	^ (self hex asString copyReplaceAll: '16r' with: '0x') asLowercase