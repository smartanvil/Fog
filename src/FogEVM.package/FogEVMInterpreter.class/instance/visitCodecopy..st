visiting
visitCodecopy: aFogVMCodecopy
	| loadingArea fromInstruction amountOfInstructions hexa |
	loadingArea := stack pop.
	fromInstruction := stack pop asBKNumber * 2 + 1.
	amountOfInstructions := stack pop asBKNumber * 2.
	hexa := program toHexa.
	hexa := hexa copyFrom: 3 to: hexa size.
	hexa := hexa copyFrom: fromInstruction to: fromInstruction + amountOfInstructions - 1.
	memory storeChunck: hexa startingAt: loadingArea ensureBytes: amountOfInstructions / 2
	"0 to: amountOfInstructions - 1 do: [ :i | memory store: (self hexa at: fromInstruction + i) at: (loadingArea + i) asBKHexa ]"