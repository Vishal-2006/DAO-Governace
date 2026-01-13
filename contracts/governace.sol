// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface IStaking {
    function stakedbalance(address user) external view returns(uint256);
    
}

contract governace {
    IStaking public stakingContract;

    struct Proposal{
        string description;
        uint256 yesvoted;
        uint256 novoted;
        bool exectued;
        mapping ( address => bool) hasVoted;

    }
    mapping(uint256 => Proposal) public proposals;
    uint256 public proposalCount;


    constructor (address _stakingContractAddress){
        stakingContract = IStaking (_stakingContractAddress);

    }

    function createProposal(string memory _description) public {
        proposalCount++;
        Proposal storage proposal = proposals[proposalCount];
        proposal.description = _description;
        proposal.exectued = false;
    }

    function vote(uint256 _proposalId , bool _support) public {
        Proposal storage proposal = proposals[_proposalId];
        require (!proposal.hasVoted[msg.sender], "you have already voted ");
        uint256 votingpower = stakingContract.stakedbalance(msg.sender);
        require(votingpower > 0 , "you have not to vote");

        if (_support){
            proposal.yesvoted +=votingpower;
        }else{
            proposal.novoted += votingpower;
        }

        proposal.hasVoted[msg.sender] = true;
        
    }

    function getproposals (uint256 _proposalId) public view returns (string memory description, uint256 yesvoted ,uint256 novoted){
        Proposal storage proposal = proposals[_proposalId];
        return (proposal.description, proposal.yesvoted, proposal.novoted);
    }
}
