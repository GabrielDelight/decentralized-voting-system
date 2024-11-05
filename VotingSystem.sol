// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract VotingSystem {
    struct Candidate {
        string name;
        uint256 voteCount;
        uint256 id;
    }

    struct Votes {
        address voterAddress;
        uint256 candidiateID;
    }

    Votes[] public votesArray;

    Candidate[] public candidateArray; // assign the struct array to a variable

    bool votingIsOngoing = true;

    address public contractOwner;

    // Init contract owner
    constructor() {
        contractOwner = msg.sender;
    }

    // Add candidiate
    function addCandidate(string memory _name) public {
        auth();
        uint256 id = 0;
        //  Increment the id for new candidiate
        if (candidateArray.length > 0) {
            Candidate memory _last_candidiate = candidateArray[
                candidateArray.length - 1
            ];
            id = _last_candidiate.id + 1;
        }

        candidateArray.push(Candidate(_name, 0, id));
    }

    // Retrieve last candidiate
    function getLastCandidiate() public view returns (Candidate memory) {
        Candidate memory _last_candidiate = candidateArray[
            candidateArray.length - 1
        ];

        return _last_candidiate;
    }

    // Get total candidateArray
    function getTotalCandidate() public view returns (uint256) {
        return candidateArray.length;
    }

    // Get all candidateArray
    function getAllCandidates() public view returns (Candidate[] memory) {
        return candidateArray;
    }

    // Get total vote count
    function getTotalVote() public view returns (uint256 total) {
        total = 0;
        for (uint256 i = 0; i < candidateArray.length; i++) {
            total += candidateArray[i].voteCount;
        }
    }

    // Vote function
    function vote(uint256 _candidiateID) public payable {
        bool isFound = false;
        bool isFirstTime = true;
        require(votingIsOngoing, "Voting has ended");
        // Check if candididate exist
        for (uint256 i = 0; i < candidateArray.length; i++) {
            if (candidateArray[i].id == _candidiateID) {
                isFound = true;
            }
        }
        require(isFound, "Candidiate does not exist");

        // Check if user has voted

        for (uint256 i = 0; i < votesArray.length; i++) {
            if (votesArray[i].voterAddress == msg.sender) {
                isFirstTime = false;
            }
        }
        require(isFirstTime, "You have already voted before");

        Votes memory voter = Votes(msg.sender, _candidiateID);
        votesArray.push(voter);

        // Update the voteCount in Candidiate
        for (uint256 i = 0; i < candidateArray.length; i++) {
            if (candidateArray[i].id == _candidiateID) {
                candidateArray[i].voteCount += 1;
            }
        }
    }

    // return all cotes
    function getAllVotes() public view returns (Votes[] memory) {
        return votesArray;
    }

    // end voting
    function endVoting() public {
        auth();
        votingIsOngoing = false;
    }

    function auth() private view {
        bool isOwner = contractOwner == msg.sender;
        require(isOwner, "You are not allowed to make this call");
    }

    // Get the winner (max voteCount)
    function getWinner() public view returns (Candidate memory) {
        Candidate memory firstCandidiate = candidateArray[0];
        for (uint256 i = 0; i < candidateArray.length; i++) {
            if (candidateArray[i].voteCount > firstCandidiate.voteCount) {
                firstCandidiate = candidateArray[i];
            }
        }

        return firstCandidiate;
    }


    uint256 public getAge = 5;

     function retrieve() public view returns (uint256) {
        return getAge;
    }
}
