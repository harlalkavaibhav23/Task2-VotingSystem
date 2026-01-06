// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    // using simpler variable names
    uint public score1;
    uint public score2;
    bool public status = true;
    address public owner;
    mapping(address => bool) public voters;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can access this");
        _;
    }

    function vote(uint _id) public {
        // checks
        require(status == true, "Voting is currently closed");
        require(voters[msg.sender] == false, "Already voted");
        require(_id == 1 || _id == 2, "Wrong ID");

        // mark as voted
        voters[msg.sender] = true;

        // update score
        if (_id == 1) {
            score1++;
        } else {
            score2++;
        }
    }

    function getVotes() public view returns (uint A, uint B) {
        return (score1, score2);
    }

    function setStatus(bool _state) public onlyOwner {
        status = _state;
    }
}
