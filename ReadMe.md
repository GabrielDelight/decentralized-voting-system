# Voting System

## Overview

This project implements a decentralized voting system using Solidity on the Ethereum blockchain. It consists of two smart contracts: `VotingSystem` and `VoteFactory`. 

The `VotingSystem` contract allows for the creation of candidates, the submission of votes, and the calculation of the winner based on the highest vote count. The `VoteFactory` contract acts as a factory for creating new instances of the `VotingSystem` contract, allowing for multiple voting rounds to be created.

This system ensures transparency, security, and immutability, as all actions (such as voting and candidate registration) are recorded on the blockchain.

## Features

- **Add Candidates:** Add candidates to the voting system.
- **Vote:** Allows users to vote for a candidate, ensuring each voter votes only once.
- **Get Total Votes:** Retrieve the total number of votes cast in the election.
- **Get Candidates:** Retrieve all candidates and their vote counts.
- **Get Winner:** Get the candidate with the most votes.
- **Voting Management:** Ability to end voting and prevent further votes.
- **Voting Factory:** Deploy new instances of the `VotingSystem` for multiple elections.

## Smart Contracts

### 1. `VotingSystem`

This is the main contract for managing the voting process.

#### Contract Structure

- **Candidate Struct:** Represents a candidate, including their name, vote count, and unique ID.
- **Votes Struct:** Represents a vote, storing the voter's address and the candidate's ID they voted for.
- **State Variables:**
  - `candidateArray`: An array of candidates.
  - `votesArray`: An array of votes cast.
  - `votingIsOngoing`: A boolean flag indicating whether the voting is still ongoing.
  - `contractOwner`: The address of the contract deployer, who has administrative privileges.

#### Functions

- **addCandidate(string memory _name):** Allows the contract owner to add a candidate to the election.
- **getLastCandidate():** Returns the last added candidate.
- **getTotalCandidates():** Returns the total number of candidates.
- **getAllCandidates():** Returns an array of all candidates.
- **getTotalVotes():** Returns the total number of votes cast.
- **vote(uint256 _candidateID):** Allows users to vote for a candidate.
- **getAllVotes():** Returns an array of all votes.
- **endVoting():** Ends the voting process, preventing further votes from being cast.
- **getWinner():** Returns the candidate with the highest number of votes.
- **retrieve():** A simple getter function that returns a predefined value (age, in this case).

### 2. `VoteFactory`

The `VoteFactory` contract acts as a factory for deploying multiple instances of the `VotingSystem`. This allows for the creation of multiple voting contracts, facilitating new elections.

#### Contract Structure

- **VotingSystem Instance:** An instance of the `VotingSystem` contract is created each time a new voting process is initialized.

#### Functions

- **createVoteContract():** Creates a new instance of the `VotingSystem` contract.
- **createCandidate(string memory _name):** Calls the `addCandidate()` function of the `VotingSystem` instance to add a candidate.
- **voteForCandidate(uint256 _candidateID):** Allows users to vote for a candidate in the active `VotingSystem`.
- **getWinner():** Retrieves the winner of the election from the `VotingSystem` contract.
- **fsGetAge():** Retrieves the age from the `VotingSystem` contract (an example of interacting with a function from the linked contract).

## Installation

To deploy and interact with these contracts, you will need to have the following tools set up:

1. **Node.js**: For managing dependencies and running scripts.
2. **Truffle or Hardhat**: For deploying and testing the smart contracts.
3. **Metamask**: To interact with the Ethereum network and manage your account.

### Steps to Deploy

1. **Clone the Repository**

   Clone the repository to your local machine:

 
