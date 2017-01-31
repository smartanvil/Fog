pragma solidity ^0.4.2;

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
    function allParticipantsHaveVoted () returns (bool) {
	for(uint x = 0; x < pollTable.length; x = x +1) {
            if (!pollTable[x].hasVoted) return false;
        }
	return true;
    }
}

