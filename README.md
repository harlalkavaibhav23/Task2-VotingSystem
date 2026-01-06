# Task 2: Voting System

This is a smart contract for a simple election between two candidates. It makes sure every person can only vote one time.

## How it Works

* **One Vote Rule:** I used a `mapping` (checklist) called `voters` to prevent cheating. Initially, all addresses are considered `false` (not voted). When someone votes, their address is marked as `true`. Hence, if they try to vote again, the code sees that they are already in the list and prevents them from voting, giving them the message "Already voted".

* **On/Off Switch:** It is a boolean variable named `status`. If it is `true`, voting is allowed. If it is `false`, the `vote` function stops working.

* **Admin Control:** Only the owner can change the status using the `setStatus` function of the On/Off switch. This is protected by the `onlyOwner` modifier.
