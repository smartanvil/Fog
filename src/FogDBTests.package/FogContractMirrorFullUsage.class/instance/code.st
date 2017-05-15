accessing
code
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