// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./VotingSystem.sol";

contract VoteFactory {
    VotingSystem public votingSystem;

    function createVoteContract() public {
        votingSystem = new VotingSystem();
    }


    // Interacting with the voting system

    // Create Vote
    function createCandidiate(string memory _name) public {
        votingSystem.addCandidate(_name);
    }

    // Get candidiate
//  function fetchCandidiate() public view returns(votingSystem.Candidate[] memory)  {


//     }

    //    function getAllCandidates() public view returns (votingSystem.Candidate[] memory) {
    //     return candidateArray;
    // }

 
    
    // Vote for candidiate
    function voteForCandidate(uint256 _candidiateID) public payable  {
        votingSystem.vote(_candidiateID);
    }

    // get winnder
    function getWinnwe() public view  {
        votingSystem.getWinner();
    }


     function fsGetAge()
        public
        view
        returns (uint256)
    {
        return votingSystem.retrieve();
    }


}
