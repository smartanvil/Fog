as yet unclassified
bootstrapInstructions
	self
		register: '0x00'
		and: 'STOP'
		and: '0'
		and: '0'
		and: 'Halts execution'.
	self
		register: '0x01'
		and: 'ADD'
		and: '2'
		and: '1'
		and: 'Addition operation'.
	self
		register: '0x02'
		and: 'MUL'
		and: '2'
		and: '1'
		and: 'Multiplication operation'.
	self
		register: '0x03'
		and: 'SUB'
		and: '2'
		and: '1'
		and: 'Subtraction operation'.
	self
		register: '0x04'
		and: 'DIV'
		and: '2'
		and: '1'
		and: 'Integer division operation'.
	self
		register: '0x05'
		and: 'SDIV'
		and: '2'
		and: '1'
		and: 'Signed integer division operation (truncated)'.
	self
		register: '0x06'
		and: 'MOD'
		and: '2'
		and: '1'
		and: 'Modulo remainder operation'.
	self
		register: '0x07'
		and: 'SMOD'
		and: '2'
		and: '1'
		and: 'Signed modulo remainder operation'.
	self
		register: '0x08'
		and: 'ADDMOD'
		and: '3'
		and: '1'
		and: 'Modulo addition operation'.
	self
		register: '0x09'
		and: 'MULMOD'
		and: '3'
		and: '1'
		and: 'Modulo multiplication operation'.
	self
		register: '0x0a'
		and: 'EXP'
		and: '2'
		and: '1'
		and: 'Exponential operation'.
	self
		register: '0x0b'
		and: 'SIGNEXTEND'
		and: '2'
		and: '1'
		and: 'Extend length of twos complement signed integer'.
	self
		register: '0x10'
		and: 'LT'
		and: '2'
		and: '1'
		and: 'Less-than comparison'.
	self
		register: '0x11'
		and: 'GT'
		and: '2'
		and: '1'
		and: 'Greater-than comparison'.
	self
		register: '0x12'
		and: 'SLT'
		and: '2'
		and: '1'
		and: 'Signed less-than comparison'.
	self
		register: '0x13'
		and: 'SGT'
		and: '2'
		and: '1'
		and: 'Signed greater-than comparison'.
	self
		register: '0x14'
		and: 'EQ'
		and: '2'
		and: '1'
		and: 'Equality comparison'.
	self
		register: '0x15'
		and: 'ISZERO'
		and: '1'
		and: '1'
		and: 'Simple not operator'.
	self
		register: '0x16'
		and: 'AND'
		and: '2'
		and: '1'
		and: 'Bitwise AND operation'.
	self
		register: '0x17'
		and: 'OR'
		and: '2'
		and: '1'
		and: 'Bitwise OR operation'.
	self
		register: '0x18'
		and: 'XOR'
		and: '2'
		and: '1'
		and: 'Bitwise XOR operation'.
	self
		register: '0x19'
		and: 'NOT'
		and: '1'
		and: '1'
		and: 'Bitwise NOT operation'.
	self
		register: '0x1a'
		and: 'BYTE'
		and: '2'
		and: '1'
		and: 'Retrieve single byte from word'.
	self
		register: '0x20'
		and: 'SHA3'
		and: '2'
		and: '1'
		and: 'Compute Keccak-256 hash'.
	self
		register: '0x30'
		and: 'ADDRESS'
		and: '0'
		and: '1'
		and: 'Get address of currently executing account'.
	self
		register: '0x31'
		and: 'BALANCE'
		and: '1'
		and: '1'
		and: 'Get balance of the given account'.
	self
		register: '0x32'
		and: 'ORIGIN'
		and: '0'
		and: '1'
		and: 'Get execution origination address'.
	self
		register: '0x33'
		and: 'CALLER'
		and: '0'
		and: '1'
		and: 'Get caller address'.
	self
		register: '0x34'
		and: 'CALLVALUE'
		and: '0'
		and: '1'
		and: 'Get deposited value by the instruction/transaction responsible for this execution'.
	self
		register: '0x35'
		and: 'CALLDATALOAD'
		and: '1'
		and: '1'
		and: 'Get input data of current environment'.
	self
		register: '0x36'
		and: 'CALLDATASIZE'
		and: '0'
		and: '1'
		and: 'Get size of input data in current environment'.
	self
		register: '0x37'
		and: 'CALLDATACOPY'
		and: '3'
		and: '0'
		and: 'Copy input data in current environment to memory'.
	self
		register: '0x38'
		and: 'CODESIZE'
		and: '0'
		and: '1'
		and: 'Get size of code running in current environment'.
	self
		register: '0x39'
		and: 'CODECOPY'
		and: '3'
		and: '0'
		and: 'Copy code running in current environment to memory'.
	self
		register: '0x3a'
		and: 'GASPRICE'
		and: '0'
		and: '1'
		and: 'Get price of gas in current environment'.
	self
		register: '0x3b'
		and: 'EXTCODESIZE'
		and: '1'
		and: '1'
		and: 'Get size of an account''s code'.
	self
		register: '0x3c'
		and: 'EXTCODECOPY'
		and: '4'
		and: '0'
		and: 'Copy an account''s code to memory'.
	self
		register: '0x40'
		and: 'BLOCKHASH'
		and: '1'
		and: '1'
		and: 'Get the hash of one of the 256 most recent complete blocks'.
	self
		register: '0x41'
		and: 'COINBASE'
		and: '0'
		and: '1'
		and: 'Get the block''s beneficiary address'.
	self
		register: '0x42'
		and: 'TIMESTAMP'
		and: '0'
		and: '1'
		and: 'Get the block''s timestamp'.
	self
		register: '0x43'
		and: 'NUMBER'
		and: '0'
		and: '1'
		and: 'Get the block''s number'.
	self
		register: '0x44'
		and: 'DIFFICULTY'
		and: '0'
		and: '1'
		and: 'Get the block''s difficulty'.
	self
		register: '0x45'
		and: 'GASLIMIT'
		and: '0'
		and: '1'
		and: 'Get the block''s gas limit'.
	self
		register: '0x50'
		and: 'POP'
		and: '1'
		and: '0'
		and: 'Remove item from stack'.
	self
		register: '0x51'
		and: 'MLOAD'
		and: '1'
		and: '1'
		and: 'Load word from memory'.
	self
		register: '0x52'
		and: 'MSTORE'
		and: '2'
		and: '0'
		and: 'Save word to memory'.
	self
		register: '0x53'
		and: 'MSTORE8'
		and: '2'
		and: '0'
		and: 'Save byte to memory'.
	self
		register: '0x54'
		and: 'SLOAD'
		and: '1'
		and: '1'
		and: 'Load word from storage'.
	self
		register: '0x55'
		and: 'SSTORE'
		and: '2'
		and: '0'
		and: 'Save word to storage'.
	self
		register: '0x56'
		and: 'JUMP'
		and: '1'
		and: '0'
		and: 'Alter the program counter'.
	self
		register: '0x57'
		and: 'JUMPI'
		and: '2'
		and: '0'
		and: 'Conditionally alter the program counter'.
	self
		register: '0x58'
		and: 'PC'
		and: '0'
		and: '1'
		and: 'Get the value of the program counter prior to the increment '.
	self
		register: '0x59'
		and: 'MSIZE'
		and: '0'
		and: '1'
		and: 'Get the size of active memory in bytes'.
	self
		register: '0x5a'
		and: 'GAS'
		and: '0'
		and: '1'
		and: 'Get the amount of available gas, including the corresponding reduction '.
	self
		register: '0x5b'
		and: 'JUMPDEST'
		and: '0'
		and: '0'
		and: 'Mark a valid destination for jumps'.
	self
		register: '0x60'
		and: 'PUSH1'
		and: '0'
		and: '1'
		and: 'Place 1 byte item on stack'.
	self
		register: '0x61'
		and: 'PUSH2'
		and: '0'
		and: '1'
		and: 'Place 2-byte item on stack'.
	self
		register: '0x7f'
		and: 'PUSH32'
		and: '0'
		and: '1'
		and: 'Place 32-byte (full word) item on stack'.
	self
		register: '0x80'
		and: 'DUP1'
		and: '1'
		and: '2'
		and: 'Duplicate 1st stack item'.
	self
		register: '0x81'
		and: 'DUP2'
		and: '2'
		and: '3'
		and: 'Duplicate 2nd stack item'.
	self
		register: '0x8f'
		and: 'DUP16'
		and: '16'
		and: '17'
		and: 'Duplicate 16th stack item'.
	self
		register: '0x90'
		and: 'SWAP1'
		and: '2'
		and: '2'
		and: 'Exchange 1st and 2nd stack items'.
	self
		register: '0x91'
		and: 'SWAP2'
		and: '3'
		and: '3'
		and: 'Exchange 1st and 3rd stack items'.
	self
		register: '0x9f'
		and: 'SWAP16'
		and: '17'
		and: '17'
		and: 'Exchange 1st and 17th stack items'.
	self
		register: '0xa0'
		and: 'LOG0'
		and: '2'
		and: '0'
		and: 'Append log record with no topics'.
	self
		register: '0xa1'
		and: 'LOG1'
		and: '3'
		and: '0'
		and: 'Append log record with one topic'.
	self
		register: '0xa4'
		and: 'LOG4'
		and: '6'
		and: '0'
		and: 'Append log record with four topics'.
	self
		register: '0xf0'
		and: 'CREATE'
		and: '3'
		and: '1'
		and: 'Create a new account with associated code'.
	self
		register: '0xf1'
		and: 'CALL'
		and: '7'
		and: '1'
		and: 'Message-call into an account'.
	self
		register: '0xf2'
		and: 'CALLCODE'
		and: '7'
		and: '1'
		and: 'Message-call into this account with an alternative account''s code'.
	self
		register: '0xf3'
		and: 'RETURN'
		and: '2'
		and: '0'
		and: 'Halt execution returning output data'.
	self
		register: '0xf4'
		and: 'DELEGATECALL'
		and: '6'
		and: '1'
		and: 'Message-call into this account with an alternative account''s code, but persisting the current values for it sender and it value'.
	self
		register: '0xfe'
		and: 'INVALID'
		and: 0
		and: 0
		and: 'Designated invalid instruction'.
	self
		register: '0xff'
		and: 'SELFDESTRUCT'
		and: '1'
		and: '0'
		and: 'Halt execution and register account for later deletion'