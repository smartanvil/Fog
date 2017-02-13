
| account contractName contract address contractsLocation gethURL contractInstance deployer |

" Configuration of the specific image "
contractsLocation :=  FileLocator contractsFolder.
gethURL := 'http://localhost:8545'.

Smalltalk arguments size = 3 ifFalse: [  
	FileStream stderr nextPutAll: 'Contract name and deployer account ID are not optional arguments' ; 
			  cr;
			  nextPutAll: 'deploy.sh contractFileName account-id';	
			  cr. 
	Smalltalk exit:1.
].
	
contractName := Smalltalk arguments at:2. 
account := Smalltalk arguments at: 3. 

" Setting of configuration and load of sources "
[
	FogConnection currentOn: gethURL.
	FogCache reset. 
	FogFileContractDescription 	loadKnownContracts: contractsLocation . 
	FogTransactionMonitorService reset; current. 
] on: Error do: [ :err | 
	FileStream stderr nextPutAll: 'Error during configuration ' , err messageText.
	Smalltalk exit: 1. 
].

contract := FogCache current contracts detect: [ : c | c fromFile basename = contractName ].

deployer :=  FogContractDeployer new
		contract: contract 	;
		owner: (FogExternalAccount new
			hash: account;
			name: 'DeployerAccount';
			yourself);
		constructorArguments: {};
		yourself.

contractInstance := deployer createAndDeployInstance.
contractInstance waitIsReady.

FileStream stdout 
	nextPutAll: 'Contract successfully deployed at address: '; 
	nextPutAll: contractInstance address.
Smalltalk exit: 0. 


