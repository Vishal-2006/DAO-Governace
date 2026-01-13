# 🏦 Decentralized Staking & Governance System

A robust DeFi architecture that integrates **Staking Rewards** with **On-Chain Governance**. This project demonstrates cross-contract communication, where a user's voting power in the DAO is dynamically calculated based on their staked balance in the Staking contract.

## 🚀 Key Features

### 1. Staking Contract (`Staking.sol`)
* **Stake & Withdraw:** Users can lock assets to earn rewards and withdraw them anytime.
* **Dynamic Rewards:** Implements a time-based reward mechanism (1 Token / Second).
* **Math Safety:** Utilizes the "Update Reward" pattern to snapshot rewards before any balance changes.

### 2. Governance Contract (`Governance.sol`)
* **Weighted Voting:** One Token = One Vote. Voting power is fetched directly from the Staking contract.
* **Proposal System:** Users can create proposals to suggest changes (e.g., "Increase Reward Rate").
* **Vote Tracking:** Prevents double-voting and tracks `Yes` vs `No` counts.
* **Inter-Contract Communication:** Uses an `Interface` (`IStaking`) to read data from the Staking contract securely.

---

## 🛠️ Tech Stack

* **Language:** Solidity (v0.8.19)
* **Environment:** Remix IDE
* **Architecture:** Modular Smart Contracts (Separation of Concerns)

---

## 🧠 Contract Logic & Architecture

### The "Money Legos" Interaction
The core innovation of this project is the link between the two contracts. Instead of issuing a separate governance token, the system uses the *Staked Balance* as the *Voting Power*.

1.  **User Stakes:** User deposits `500` tokens into `Staking.sol`.
2.  **User Votes:** User calls `vote()` on `Governance.sol`.
3.  **The Check:** `Governance.sol` calls `IStaking(address).stakedbalance(user)` to verify the 500 tokens.
4.  **The Result:** The proposal receives 500 "Yes" votes.

---

## 📸 Screenshots

### 1. Staking & Rewards Generation
<img width="270" height="527" alt="image" src="https://github.com/user-attachments/assets/689042f4-0804-4753-8d27-28f52611d0e4" />


### 2. Governance Voting
<img width="272" height="690" alt="image" src="https://github.com/user-attachments/assets/1a8046b1-9c01-4c2e-9375-28b0db8e3d7a" />


---

## 💻 How to Run (Remix IDE)

1.  **Clone the Repo:**
    ```bash
    git clone [https://github.com/Vishal-2006/staking-governance-demo.git](https://github.com/Vishal-2006/staking-governance-demo.git)
    ```
2.  **Open in Remix:**
    Load the files into [Remix IDE](https://remix.ethereum.org/).

3.  **Deploy Staking Contract:**
    * Compile & Deploy `Staking.sol`.
    * Copy the Deployed Address.

4.  **Deploy Governance Contract:**
    * Select `Governance.sol`.
    * Paste the Staking Address into the constructor parameter `_stakingContractAddress`.
    * Deploy.

5.  **Test:**
    * Stake tokens in the Staking contract.
    * Create a proposal in Governance.
    * Vote and check `getProposalStatus`.

---

## 🔗 Connect with Me

* **Developer:** Vishal R B
* **LinkedIn:** https://www.linkedin.com/in/vishal-r-b-52352b289/
* **GitHub:** https://github.com/Vishal-2006

---
*Built with 💙 for Web3*
