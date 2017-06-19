gttools
inspect: bytecode on: composite title: title
	^ composite table
		title: title;
		display: [ bytecode ];
		column: 'Address' evaluated: [ :e | e byteNumber asBKHexa: 5 ];
		column: 'Instruction' evaluated: #instruction;
		send: #value