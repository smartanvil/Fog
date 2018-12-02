Class {
	#name : #FogTestingContractProvider,
	#superclass : #Object,
	#category : #FogLiveTests
}

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> contractDescriptions [
	^ self packagesDescriptions flatCollect: #descriptions
]

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> contractsDescriptions: aSession [
	^ self contractsDescriptionsSrc
		flatCollect: [ :f | (aSession loadPackageForCode: f named: UUID new asString) descriptions ]
]

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> contractsDescriptionsSrc [
	^ {self fullUsageContractSrc.
	self multipleTestContractSrc.
	self public3StatesPollContractSrc.
	self simpleSmartContractSrc.
	self structSmartContractSrc}
]

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> fullUsageContractSrc [
	^ 'pragma solidity ^0.4.2;


/*
	This example implements all the possible types for method call, and return
	So far there is not support for:
		Struct,
		Mapping
		FixedPointType 
*/

contract FullUsage {

   /* Type Definition */
    enum EnumDefinition { POSITIVE , NEGATIVE , NEUTRAL }
    
   /* Properties */
    address owner;
    string str;
    int256 negativeInt;
    int256 positiveInt; 
    EnumDefinition enumEntry;
    int256[] commonArray;
    string str2;
    
     /* Constructor */
    function FullUsage () { 
        owner = msg.sender;
	negativeInt = -1;
	positiveInt = 255; 
	commonArray.push(1);
	commonArray.push(20);
	str = ''String'';
	enumEntry = EnumDefinition.NEUTRAL;
    }


    function setString (string value) {
      str = value;
    }
    function getString () constant returns (string ret) {
      ret = str;
    }
    function setTwoStrings( string value1, string value2 ) {
      str = value1;
      str2 = value2;
    }
    function setTwoStringsEnumInt( string value1, EnumDefinition valEnum, int256 valInt, string value2 ) {
      str = value1;
      str2 = value2;
      enumEntry = valEnum;
      positiveInt = valInt;
    }

    function getExample () constant returns (int256 val, string val2, string val4, int256 val3, EnumDefinition en) {
	val = positiveInt;
	val2 = str;
	val4 = str;
	val3 = negativeInt;
	en = enumEntry; 
    }
    function getExample2 () constant returns (string val2, int256 val, int256 val3, EnumDefinition en, string val4) {
	val = positiveInt;
	val2 = str;
	val4 = str;
	val3 = negativeInt;
	en = enumEntry; 
    }
    function getExample3 () constant returns (int256 val, string val2, EnumDefinition en,  string val4, int256 val3) {
	val = positiveInt;
	val2 = str;
	val4 = str;
	val3 = negativeInt;
	en = enumEntry; 
    }
  /* Setting And getting array */
    function setSimpleArray (int256 [] value) {
          commonArray = value;
    }
 
  /* Setting And getting signed int */
    function setNegativeInt(int256 negative) {
      if (negative > 0) throw; 
      negativeInt = negative;
    }
    
    function setPositiveInt(int256 positive) {
      if (positive < 0) throw;
      positiveInt = positive;
    }
    
    function getNegativeInt() constant returns (int256 ret) {
       ret = negativeInt;
    }

    function getPositiveInt() constant returns (int256 ret) {
       ret = positiveInt;
    }

    function getArray () constant returns (int256 []) {
	return commonArray;
    } 
 /* Setting And getting Enum  */
    function setEnum (EnumDefinition value) {
        enumEntry = value;
    }
    function getEnum () constant returns (EnumDefinition value) {
        value =  enumEntry ;
    }




    
}
'
]

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> multipleTestContractSrc [
	^ 'pragma solidity ^0.4.2;

contract StructTestContract {

    enum myenum { A, B, C }

    struct  mystruct {
        bool    boolean;
        myenum  uservalue;
        uint32  commonvalue;
    }
    address     _owner;
    bool bool1;
    int16 midint;
    mystruct simpleExample;
    bool bool2;
    mystruct[] arrayExample;
    mapping(uint=>mystruct) mappingExample;

    function StructTestContract (){
        _owner = msg.sender;
	bool1 = true;
	bool2 = true;
	midint = 32;
	simpleExample.boolean = true; 
	simpleExample.uservalue = myenum.B;
	simpleExample.commonvalue = 6355432;
	arrayExample.push(mystruct(true, myenum.A, 134));
	arrayExample.push(mystruct(false, myenum.B, 235 ));
	arrayExample.push(mystruct(true, myenum.C, 34 ));
	mappingExample[2] = mystruct(true, myenum.C, 34 );
	mappingExample[10] = mystruct(true, myenum.C, 34 );
    }
   
    function kill() {
        suicide(_owner);
    }
       
    
}
'
]

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> packagesDescriptions [
	| session |
	session := FogSession new.
	^ self contractsDescriptionsSrc
		collect: [ :f | session loadPackageForCode: f named: #test ]
]

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> public3StatesPollContract: session [
	^ (session loadPackageForCode: self public3StatesPollContractSrc named: #test)
		descriptions anyOne
]

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> public3StatesPollContractSrc [
	^ 'pragma solidity ^0.4.8;

contract Public3StatesPoll {

   /* Type Definition */
    enum Choice { POSITIVE , NEGATIVE , NEUTRAL }
    struct Columns {  address user; Choice choice ; bool hasVoted; }

   /* Properties */
    Columns[] pollTable; 
    address owner;
    
     /* Constructor */
    function Public3StatesPoll () { 
        owner = msg.sender;
    }
    /* Functions */ 
    function isRegistered (address voterAccount) returns(bool registered){
        registered = (voterIndex (voterAccount) >= 0);
    }
    function voterIndex (address voterAccount) returns(int256 index){
        for(uint x = 0; x < pollTable.length; x = x +1) {
            if (pollTable[x].user == voterAccount) {
                return int(x);
            }
        }
        return -1;
    }
    function addVoter(address voterAccount) returns(uint256){
        if(owner != msg.sender) throw; 
        if(isRegistered(voterAccount)) throw; 
        pollTable.push(Columns(voterAccount, Choice.NEUTRAL, false));
        return pollTable.length -1;
    }
    function vote (Choice choice) {
        uint index;
	uint sarasa =2;

        if (!isRegistered(msg.sender)) throw; 
        index = uint(voterIndex(msg.sender));
        pollTable[index].choice = choice;
    }
    function votesFor(Choice choice) {
       uint votes = 0;
       for(uint x = 0; x < pollTable.length; x = x +1) {
            if (pollTable[x].hasVoted && pollTable[x].choice == choice) 
                votes = votes +1;
        }
    }
    function allParticipantsHaveVoted () view returns (bool) {
	for(uint x = 0; x < pollTable.length; x = x +1) {
            if (!pollTable[x].hasVoted) return false;
        }
	return true;
    }
}

'
]

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> simpleSmartContractSrc [
	^ 'pragma solidity ^0.4.2;

contract SimpleStorage {
    address     _owner;
    uint storedData;
    bool test2;
    bool test3;
    bool test4;
    
    function SimpleStorage (){
        _owner = msg.sender;
	test2 = true;
	storedData = 3;
    }
    function kill() {
        suicide(_owner);
    }
    
    function getAddr() constant returns (address retVal) {
        return _owner;
    }
    function getBool() constant returns (bool retVal) {
        return test2;
    }
    function test() {
        test2 =   _owner == msg.sender;
    }
    function set(uint x) {
        storedData = x;
    }
    function get() constant returns (uint retVal) {
	retVal = storedData;
    }
    
    
}'
]

{ #category : #'as yet unclassified' }
FogTestingContractProvider class >> structSmartContractSrc [
	^ 'pragma solidity ^0.4.2;

contract StructTestContract {

    enum myenum { A, B, C }

    struct  mystruct {
        bool    boolean;
        myenum  uservalue;
        uint32  commonvalue;
    }
    address     _owner;
    bool bool1;
    int16 midint;
    mystruct simpleExample;
    bool bool2;
    mystruct[] arrayExample;
    
    function StructTestContract (){
        _owner = msg.sender;
	bool1 = true;
	bool2 = true;
	midint = 32;
	simpleExample.boolean = true; 
	simpleExample.uservalue = myenum.B;
	simpleExample.commonvalue = 6355432;
	arrayExample.push(mystruct(true, myenum.A, 134));
	arrayExample.push(mystruct(false, myenum.B, 235 ));
	arrayExample.push(mystruct(true, myenum.C, 34 ));
    }
   
    function kill() {
        suicide(_owner);
    }
       
    
}'
]
